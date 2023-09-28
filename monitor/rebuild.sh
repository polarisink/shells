docker rm -f grafana prometheus mysql-exporter node-exporter mysql-test  test-prometheus
docker-compose up -d
docker inspect prometheus
