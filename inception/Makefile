# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iounejja <iounejja@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/12 16:42:41 by iounejja          #+#    #+#              #
#    Updated: 2021/10/20 11:38:05 by iounejja         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE-FILE = ./srcs/docker-compose.yml

make: folders build run

folders:
	mkdir -pv ~/data/site-files
	mkdir -pv ~/data/database
	mkdir -pv ~/data/influxdb
	
build:
	cd srcs && docker compose build

run:
	docker compose -f $(DOCKER-COMPOSE-FILE) up -d

down:
	docker compose -f $(DOCKER-COMPOSE-FILE) down

clean:
	$(if $(strip $(shell docker ps -qa)), docker stop $(shell docker ps -qa))
	$(if $(strip $(shell docker ps -qa)), docker rm -f $(shell docker ps -qa))
	$(if $(strip $(shell docker images -qa)), docker rmi -f $(shell docker images -qa))
	$(if $(strip $(shell docker volume ls -q)), docker volume rm $(shell docker volume ls -q))

clean_volumes:
	sudo rm -rf ~/data/database/*
	sudo rm -rf ~/data/site-files/*
	sudo rm -rf ~/data/influxdb/*

re: down build run
