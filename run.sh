cp "fake_logs_generator.py" "/usr/local/bin/fake_logs_generator.py"
cp "fake-logger.service" "/etc/systemd/system/fake-logger.service"
chmod 664 "/etc/systemd/system/fake-logger.service"
systemctl daemon-reload
systemctl start fake-logger
