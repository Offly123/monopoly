all: help

help:
	@echo
	@echo "===============СБОРКА==============="
	@echo "all         - Собрать все контейнеры"
	@echo "nginx       - Собрать nginx контейнер"
	@echo "scala       - Собрать scala контейнер"
	@echo
	@echo "==========ЗАПУСК/ОСТАНОВКА=========="
	@echo "run         - Запустить контейнеры"
	@echo "stop        - Остановить контейнеры"
	@echo "kill        - Убить контейнеры :("
	@echo
	@echo "==============ПОЛЕЗНОЕ=============="
	@echo "bash-nginx  - Залезть внутрь nginx "
	@echo "bash-scala  - Залезть внутрь scala" 
	@echo



# "===============СБОРКА==============="
build: nginx scala

nginx:
	docker build ./web-client -t offly:monopoly-nginx

scala:
	docker build ./scala-server -t offly:monopoly-scala



# "==========ЗАПУСК/ОСТАНОВКА=========="

run:
	docker compose up -d

stop:
	docker container stop monopoly-nginx monopoly-scala

kill:
	docker container kill monopoly-nginx monopoly-scala



# "==============ПОЛЕЗНОЕ=============="

bash-nginx:
	docker exec -it monopoly-nginx bash

bash-scala:
	docker exec -it monopoly-scala bash
