COMPOSE := docker compose -f srcs/docker-compose.yml

all: build up

up:
	$(COMPOSE) up

build:
	cp $(HOME)/Desktop/ENV_INCEP/.env ./srcs/.env
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	$(COMPOSE) build

start:
	$(COMPOSE) start

restart:
	$(COMPOSE) restart

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down --rmi all --volumes --remove-orphans

ps:
	$(COMPOSE) ps

images:
	docker images

volume:
	docker volume ls

clean: down

fclean: clean
		sudo rm -rf /home/$(USER)/data/wordpress/*
		sudo rm -rf /home/$(USER)/data/mariadb/*

prune:	fclean
		docker system prune -f -a

re: fclean all
	
.PHONY: all up build start restart stop down ps images volume clean fclean prune re
