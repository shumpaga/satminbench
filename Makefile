build:
	docker build -t shumpaga/satminbench:latest satminbench

push:
	docker push shumpaga/satminbench:latest

run:
	-docker run -i -t shumpaga/satminbench /bin/bash
