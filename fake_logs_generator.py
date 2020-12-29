import time
import random
from datetime import datetime

statuses = {
"INFO": [200, 206],
"WARN": [400, 404, 418],
"ERROR": [500, 502, 505]
}

resources = {
"GET": ["/download", "/search", "/api/captcha"],
"POST": ["/api/user/login", "/api/user/logout"]
}

users = ["WeslyG", "Axonny", "Kamel", "Viayto", "Stozowh",
"Baria", "Lety", "Yosyari", "Deryna", "Yuline",
"Lequrin", "Mimana", "Guibe", "Tanelal", "Failyn"]

def get_date_time_now() -> str:
    return datetime.today().strftime("%Y.%m.%d %H:%M:%S")

def get_resource_path() -> str:
    method = random.choice(list(resources.keys()))
    path = random.choice(resources[method])
    return f"{method} {path}"

if __name__ == "__main__":
    while True:
        date_time = get_date_time_now()
        severity = random.choice(list(statuses.keys()))
        http_status = random.choice(statuses[severity])
        request_user = random.choice(users)
        request_time = random.randint(1, 100)
        resource_path = get_resource_path()
        log = f"{date_time} {severity} {http_status} {request_user} {request_time} {resource_path}"
        print(log)
        with open("/var/log/fake_logs.log", "a", encoding="utf-8") as f:
            f.write(f"{log}\n")
        time.sleep(10)
