FROM centos
ENV container=docker
COPY /app /app
COPY container.target /etc/systemd/system/container.target
COPY /app/fake_logs_generator.py /usr/local/bin/fake_logs_generator.py
COPY /app/fake-logger.service /etc/systemd/system/fake-logger.service
WORKDIR /app
RUN ln -sf /etc/systemd/system/container.target /etc/systemd/system/default.target
RUN yum install python3 -y
ENTRYPOINT /sbin/init
STOPSIGNAL SIGRTMIN+3
