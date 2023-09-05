
CONTAINER = $(shell docker ps -a -q)
VOLUME = $(shell docker volume ls -q)

all: build start

build :
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml create

start :	
	docker-compose -f srcs/docker-compose.yml start

re reload : fclean build start

stop :
	docker-compose -f srcs/docker-compose.yml stop
	# docker-compose down

purge fclean : stop
	docker system prune -af
	docker volume prune -f
	# sudo service docker stop
	# sudo service docker start
	# echo $(VOLUME)
ifneq ($(VOLUME),)
	echo lol
	docker volume rm $(VOLUME)
endif
# ifdef ($(CONTAINER))
#	 docker rm -f $(CONTAINER)
# endif


log logs :
	@printf "*-----------------------------------------------------*\n"
	@printf "|                        NGINX                        |\n"
	@printf "*-----------------------------------------------------*\n"
	@cd srcs; docker-compose logs nginx; cd -
	@printf "*-----------------------------------------------------*\n"
	@printf "|                      WORDPRESS                      |\n"
	@printf "*-----------------------------------------------------*\n"
	@cd srcs; docker-compose logs wordpress; cd -
	@printf "*-----------------------------------------------------*\n"
	@printf "|                       MARIADB                       |\n"
	@printf "*-----------------------------------------------------*\n"
	@cd srcs; docker-compose logs mariadb; cd -
