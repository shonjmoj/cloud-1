all : 
	cd ./srcs/ && docker compose up -d 

stop :
	cd ./srcs/ && docker compose down

clean : stop 
	docker volume rm srcs_wordpress_db srcs_wordpress_files

fclean : clean
	docker system prune -af

re : fclean all