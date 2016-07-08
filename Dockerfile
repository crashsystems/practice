FROM ubuntu:16.04
MAINTAINER "Dustin Shiver, drandal.shiver@gmail.com"
WORKDIR /var/www/ghost

RUN apt-get update;\ 
	apt-get install -y build-essential curl nodejs unzip;\
	apt-get install -y npm;\
	ln -s /usr/bin/nodejs /usr/bin/node;\
	curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip;\
	mkdir /var/www;\
	unzip -uo ghost.zip -d /var/www/ghost;\
	npm install --production;\
	cp config.example.js config.js;\
	sed -i 's/127.0.0.1/172.17.0.2/g' config.js

ENTRYPOINT ["npm"]
CMD ["start", "--production"]
