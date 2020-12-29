cp "fake_logs_generator.py" "/usr/local/bin/fake_logs_generator.py"
systemctl daemon-reload
systemctl start fake-logger
