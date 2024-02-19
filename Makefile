# Docker image name
IMAGE_NAME = my-ngrok-ssh-container

# Docker container name
CONTAINER_NAME = ngrok-ssh-container

# Build the Docker image
build:
 docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
 docker run --name $(CONTAINER_NAME) -d -p 80:80 -p 8888:8888 -p 8080:8080 -p 443:443 -p 5130:5130 \
 -p 5131:5131 -p 5132:5132 -p 5133:5133 -p 5134:5134 -p 5135:5135 -p 3306:3306 $(IMAGE_NAME)

# Stop and remove the Docker container
stop:
 docker stop $(CONTAINER_NAME)
 docker rm $(CONTAINER_NAME)

# Clean up the Docker images and containers
clean:
 docker stop $(CONTAINER_NAME)
 docker rm $(CONTAINER_NAME)
 docker rmi $(IMAGE_NAME)

.PHONY: build run stop clean
