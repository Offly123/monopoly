all: nginx scala prolog

help:
	@echo
	@echo "===============СБОРКА==============="
	@echo "all         - Собрать все контейнеры"
	@echo "nginx       - Собрать nginx контейнер"
	@echo "scala       - Собрать scala контейнер"
	@echo "prolog      - Собрать prolog контейнер"
	@echo
	@echo "==========ЗАПУСК/ОСТАНОВКА=========="
	@echo "run         - Запустить контейнеры"
	@echo "stop        - Остановить контейнеры"
	@echo "kill        - Убить контейнеры :("
	@echo
	@echo
	@echo "==============ПОЛЕЗНОЕ=============="
	@echo "bash-nginx  - Залезть внутрь nginx "
	@echo "bash-scala  - Залезть внутрь scala" 
	@echo "bash-prolog - Залезть внутрь prolog"
	@echo



# "===============СБОРКА==============="

nginx:
	docker build ./web-client -t offly:monopoly-nginx

scala:
	docker build ./scala-server -t offly:monopoly-scala

prolog:
	docker build ./prolog-bot -t offly:monopoly-prolog



# "==========ЗАПУСК/ОСТАНОВКА=========="

run:
	docker compose up -d

stop:
	docker container stop monopoly-nginx monopoly-scala monopoly-prolog

kill:
	docker container kill monopoly-nginx monopoly-scala monopoly-prolog



# "==============ПОЛЕЗНОЕ=============="

bash-nginx:
	docker exec -it monopoly-nginx bash

bash-scala:
	docker exec -it monopoly-scala bash

bash-prolog:
	docker exec -it monopoly-prolog bash