build:
	sudo docker build -t shumpaga/satminbench:latest satminbench

push:
	sudo docker push shumpaga/satminbench:latest

run:
	-sudo docker run -i -t shumpaga/satminbench /bin/bash

pull:
	sudo docker pull shumpaga/satminbench:latest
