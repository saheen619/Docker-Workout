# Docker commands for creating a docker file, image and managing a container


saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-W
$ cd app

saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-W
$ ls
docker-compose.yml  package.json  spec/  src/  yarn.lock

saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-W
$ touch Dockerfile

saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-W
$ docker build -t getting-started:tatest .
[+] Building 54.6s (10/10) FINISHED
 => [internal] load .dockerignore                                        
 => => transferring context: 2B                                          
 => [internal] load build definition from Dockerfile                     
 => => transferring dockerfile: 160B                                     
 => [internal] load metadata for docker.io/library/node:18-alpine        
 => [auth] library/node:pull token for registry-1.docker.io              
 => [1/4] FROM docker.io/library/node:18-alpine@sha256:1ccc70acda680aa4ba
 => => resolve docker.io/library/node:18-alpine@sha256:1ccc70acda680aa4ba
 => => sha256:1ccc70acda680aa4ba47f53e7c40b2d4d6892de74817128e0662d32647d
 => => sha256:44aaf1ccc80eaed6572a0f2ef7d6b5a2982d54481e4255480041ac92221
 => => sha256:6f44d13dd2586511d630d7708da1eaac09c05693d9e3e06f3f72206927d
 => => sha256:f56be85fc22e46face30e2c3de3f7fe7c15f8fd7c4e5add29d7f64b87ab
 => => sha256:931b0e865bc24d4d3f7032c4a9b98b4790ee7bb8dcd0d2fd02e15e163d8
 => => sha256:60542df8b663b3c876b9fd0ad8459ac628a50bd8684149e54c3dff2e443
 => => sha256:062e26bc2446cf92691255ec92cacfd68fdb24004e2b9343f416105b2f7
 => => extracting sha256:f56be85fc22e46face30e2c3de3f7fe7c15f8fd7c4e5add2
 => => extracting sha256:931b0e865bc24d4d3f7032c4a9b98b4790ee7bb8dcd0d2fd
 => => extracting sha256:60542df8b663b3c876b9fd0ad8459ac628a50bd8684149e5
 => => extracting sha256:062e26bc2446cf92691255ec92cacfd68fdb24004e2b9343
 => [internal] load build context                                        
 => => transferring context: 4.59MB                                      
 => [2/4] WORKDIR /app                                                   
 => [3/4] COPY . .                                                       
 => [4/4] RUN yarn install --production                                  
 => exporting to image                                                   
 => => exporting layers                                                  
 => => writing image sha256:d78da007c26b1e7dbd097e815d1163b11151b51f50378
 => => naming to docker.io/library/getting-started:tatest                



saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-Workout/getting-started-main/app (main)
$ docker image ls

saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories/Docker-Workout/getting-started-main/app (main)
$ docker run -p 3000:3000 d78da
Using sqlite database at /etc/todos/todo.db
Listening on port 3000


saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND               CREATED          STATUS          PORTS                    NAMES
28cd76c6e1f7   d78da     "node src/index.js"   11 minutes ago   Up 11 minutes   0.0.0.0:3000->3000/tcp   agitated_beaver

saheenpc@LAPTOP-K4H46N4U MINGW64 ~/OneDrive/Desktop/Repositories
$ docker stop 28cd
28cd

