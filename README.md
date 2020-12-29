# How to build the docker container
### Method 1
1. Clone this repository.
2. Run `docker build --tag logger .` in root directory.
3. Run `docker run --detach --name=centos-systemd --mount type=bind,source=/sys/fs/cgroup,target=/sys/fs/cgroup --mount type=bind,source=/sys/fs/fuse,target=/sys/fs/fuse --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock logger`.

### Method 2
1. Run `docker pull axonny/logger`.
2. Run `docker run --detach --name=centos-systemd --mount type=bind,source=/sys/fs/cgroup,target=/sys/fs/cgroup --mount type=bind,source=/sys/fs/fuse,target=/sys/fs/fuse --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock logger`.

# How to use bash files
You can just run the `.sh` file, then logs from `/var/log/fake_logs.log` will be read by default. You can also specify the path to the log file.

For example:
`./count.sh log.txt`
# Systemd
+ `systemctl start fake-logger`  starts the daemon.
+ `systemctl stop fake-logger`  stops the daemon.
+ `systemctl restart fake-logger`  restarts the daemon.

*the service is started by default in the docker container.*

#### link: [Docker Hub](https://hub.docker.com/repository/docker/axonny/logger)
