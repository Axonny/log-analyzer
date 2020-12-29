#!/bin/bash
users=()
path='/var/log/fake_logs.log'
if [ -n "$1" ]; then
  path=$1
fi

read_users(){
  IFS=' '
  while read -r Line; do
    read -r -a ln <<< "$Line"
    if  [ "$(get_index "${ln[4]}")" == -1 ]; then
      users+=( "${ln[4]}" 0 )
    fi
    (( users[$(get_index "${ln[4]}")+1] += 1 ))
  done < "$path"
}

get_index () {
  local seeking=$1
  local index=0
  for element in "${users[@]}"; do
    if [[ "$element" == "$seeking" ]]; then
      break
    fi
    (( index += 1 ))
  done
  if [[ "${#users[@]}" == "$index" ]]; then
    index=-1
  fi
  echo $index
}

delete_element () {
  local delete=$1
  local flag=0
  local new_array=()
  for element in "${users[@]}"; do
    if [[ "$flag" == 1 ]]; then
      flag=0
      continue
    fi
    if [[ "$element" == "$delete" ]]; then
      flag=1
      continue
    fi
    new_array+=( "$element" )
  done

  users=("${new_array[@]}")
  unset new_array
}

get_leaderboard () {
  echo "Top users"
  local length=${#users[@]}/2
  for ((i=0; i < "$length"; i++)); do
    max=0
    user="s"
    for ((j=0; j < ${#users[@]}/2; j++)); do
      if [[ ${users[$j*2+1]} > $max ]]; then
        max=${users[$j*2+1]}
        user=${users[$j*2]}
      fi
    done
    echo "$user $max"
    delete_element "$user"
  done
}

main() {
  read_users
  get_leaderboard
}

main
