build:
	docker build -t srzzumix/oneapi-hpckit .

run:
	docker run -it --rm srzzumix/oneapi-hpckit bash 

version:
	docker run -it --rm srzzumix/oneapi-hpckit icx --version 
