# Docker

## <span style="color:orange"> CREATING A DOCKER FILE </span>

### Format of a Dockerfile

```docker
FROM <image>

COPY <source> <destination>

WORKDIR <default path>

RUN <command>

CMD <command>
```

## In the above format, each of them are described as:

The FROM instruction in a Dockerfile specifies the base image that the Dockerfile will build on top of. The base image can be any valid Docker image, including official images from Docker Hub and custom images that you have created.

```docker
FROM python:3.8-alpine
```

The COPY instruction copies the contents of the current directory to the /app directory in the container. This is where our Python application will be stored.

```docker
COPY . /app
```

The WORKDIR instruction sets the working directory to /app. This is the directory that will be used as the starting point for all subsequent commands.

```docker
WORKDIR /app
```

The RUN instruction executes the pip install command to install the dependencies that are listed in the requirements.txt file.This file is a text file that lists the Python packages that are required for our application to run.

```docker
RUN pip install -r requirements.txt
```

The CMD instruction specifies the command that will be run when the container starts. In this case, we are running the python app.py command. This will start our Python application.

```docker
CMD python-app.py
```

## <span style="color:orange">Additional commands which could be used in a dockerfile:</span>

`ADD` : This command is similar to the COPY command, but it can also download files from the internet.   
   
`EXPOSE` : This command exposes a port in the Dockerfile. Exposing a port allows other Docker containers to connect to the Dockerfile.
    
`ENTRYPOINT` : This command is similar to the CMD command, but it cannot be overridden when the Dockerfile is executed.
   
`VOLUME` : This command creates a volume in the Dockerfile. Volumes are used to store data that is not part of the Dockerfile.
   
`LABEL` : This command adds a label to the Dockerfile. Labels are used to identify the Dockerfile.
   
`ONBUILD` : This command specifies a command that will be run when a new Dockerfile is built based on the current Dockerfile.

`ENV` : 
The ENV command in a Dockerfile is used to set environment variables within the image. Environment variables are a way to pass configuration data to an application or script that is running in the container. The ENV command takes two arguments: the name of the environment variable and the value of the environment variable. For example, the following command would set an environment variable named FOO to the value bar:

```docker
ENV FOO bar
```
Environment variables can be used to configure a wide variety of things, such as the database connection string, the location of the log files, or the port that the application is listening on. They can also be used to control the behavior of the application or script. For example, the following command would set the DEBUG environment variable to true, which would cause the application to print debugging information to the console:
```docker
ENV DEBUG true
```
Another Dockerfile is as follows:
```docker
FROM python:3.7-alpine          
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["flask","run"]
```


## <span style="color:orange">Built docker image using  Dockerfile</span>

Once the Dockerfile has been created, you can build the image using the following command:

```docker
docker build -t my-app .
```

This will create a Docker image named my-app. The `-t` flag specifies the name of the image to build, and the `.` tells Docker to build the image from the current directory.

### <span style="color:DodgerBlue">You may now check if the docker image has been created and the list of available docker images in the system using the following command:</span>

```docker
docker image ls
```

## <span style="color:orange">Run the docker image using the following command:</span>

```docker
docker run -it my-app
```

This will start a container from the my-app image and will open a shell inside the container. You can then run your Python application in the container. The -it flags tell Docker to attach the terminal to the container, so you can see the output of the application.

#### <span style="color:DodgerBlue">OR</span>

```docker
docker run -it my-app my-file.txt
```

If you have a more complex application, you may need to pass arguments to the application. For example, if you want to pass the name of a file to the application. The above command will start a new Docker container and run the Python application with the my-file.txt file as input.

#### <span style="color:DodgerBlue">OR</span>

```docker
docker run -p 5001:5000 my-app
```

The command docker run -p 5001:5000 my-app will start a new Docker container and run the application in the container. The -p flag tells Docker to publish the port 5001 on the host machine to port 5000 in the container. This means that you can access the application at http://localhost:5001.

## <span style="color:DodgerBlue">Once the Container starts, you may check the list of containers running in the system by :</span>

```docker
docker ps
```

## <span style="color:DodgerBlue">To stop a running docker container :</span>

```docker
docker stop <CONATINER_ID>
```
## <span style="color:DodgerBlue">To remove a docker image :</span>
```docker
docker rmi <IMAGE_NAME>
```
## <span style="color:DodgerBlue">To remove a docker container :</span>

```docker
docker rm <CONATINER_ID>
```
## <span style="color:DodgerBlue">To see the logs of a container :</span>
```docker
docker logs -f <CONATINER_ID>
```
# <span style="color:orange">Different modes in which we can run a docker image.</span>

• Attached mode   
• Detached mode   
• Interactive mode

<span style="color:DodgerBlue">**Attached mode**</span> is the default mode when running a Docker image. In attached mode, the Docker client will attach to the container's standard input, output, and error streams. This means that you can see the output of the container as it runs, and you can interact with the container by typing commands into the standard input stream.

<span style="color:DodgerBlue">**Detached mode**</span> allows you to start the container and then let it run in the background while you continue working on other tasks in your terminal. To run a container in detached mode, you use the -d flag with the docker run command. The following command will start a container in detached mode and run the nginx web server:

```docker
docker run -d nginx
```
<span style="color:DodgerBlue">**Interactive mode**</span> allows you to start a container and then interact with it in a shell. To run a container in interactive mode, you use the -it flag with the docker run command. For example, the following command will start a container in interactive mode and run the bash shell:

```docker
docker run -it bash
```
# <span style="color:orange">Persisting the container data - Docker Volume :</span>

By default, the app stores its data in a SQLite Database at /etc/my-app/myapp.db.   
With the database being a single file, if we can persist that file on the host and make it available to the next container, it should be able to pick up where the last one left off. By creating a volume and attaching (often called "mounting") it to the directory the data is stored in, we can persist the data. As our container writes to the myapp.db file, it will be persisted to the host in the volume. We are going to use a named volume.

Create a volume by using the following command:
```docker
docker volume create myapp-db
```
Start the app container, but add the -v flag to specify a volume mount. We will use the named volume and mount it to /etc/myapp, which will capture all files created at the path.

```docker
docker run -dp 3000:3000 -v myapp-db:/etc/myapp getting-started
```
## <span style="color:DodgerBlue">To know details of the Volume used:</span>

Where is Docker actually storing my data when I use a named volume? Use the following command :

```docker
docker volume inspect myapp-db
```
Provides the following output :
```docker
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/myapp-db/_data",
        "Name": "myapp-db",
        "Options": {},
        "Scope": "local"
    }
]
```
As you can see, that the data is stored in the mountpoint of the host system. Thus, immediate changes in the code wont be responded by the application running in the container without restarting the container from scratch.

## <span style="color:DodgerBlue">Volume using Bind Mounts - Quick Volume Type</span>

With bind mounts, we control the exact mountpoint on the host. We can use this to persist data, but is often used to provide additional data into containers. When working on an application, we can use a bind mount to mount our source code into the container to let it see code changes, respond, and let us see the changes right away.

A bind mount is a file or directory on the host machine that is mounted into a container. This allows you to share files and directories between the host machine and the container. Bind mounts are often used to share source code, configuration files, or data files between the host machine and the container. 

Bind mounts and named volumes are the two main types of volumes that come with the Docker engine. For python, we can use a package called py-mon which could monitor changes in the source code and restart the container along with new changes.

1. Go to the default source code directory for the app
2. Run docker run command as follows:

```docker
docker run -dp 3000:3000 \
           -w /app \
           -v "$(pwd):/app" \ 
           python:3.8-slim \
           py-mon /app/app.py
```

This command will create a Docker container running the `Python:3.8-slim` image. `-dp 3000:3000` will run the conatiner in detached (background) mode and create a port mapping. `-w /app` sets the container's present working directory where the command will run from. The `-v` flag mounts the current working directory `($(pwd))` to the container as `/app`. This means that any changes you make to your Python script in the current working directory will be reflected in the container. And the `py-mon` command will automatically run your Python script when it detects file changes.

In order to prepare for production, we need to migrate our database from working in SQLite to something that can scale a little better like a relational database and switch our application to use MySQL.

# <span style="color:orange">Multicontainer Applications through Networking</span>

Remember that containers, by default, run in isolation and don't know anything about other processes or containers on the same machine. But, If two containers are on the same network, they can talk to each other. If they aren't, they can't. There are two ways to put a container on a network: 1) Assign it at start or 2) connect an existing container. For now, we will create the network first and attach the MySQL container at startup.

1. Create the network
```docker
docker network create myapp
```
2. Start a MySQL container and attach it to the network. We're also going to define a few environment variables that the database will use to initialize the database.
```docker
docker run -d \
    --network myapp --network-alias mysql \
    -v myapp-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=myappdb \
    mysql:8.0
```
Note : In the above commands, we're using a volume named myapp-mysql-data here and mounting it at /var/lib/mysql, which is where MySQL stores its data. However, we never ran a docker volume create command. Docker recognizes we want to use a named volume and creates one automatically for us.

3. To confirm we have the database up and running, connect to the database and verify it connects.
```docker
docker exec -it <mysql-container-id> mysql -p
```
When the password prompt comes up, type in secret. In the MySQL shell, list the databases and verify you see the myappdb database.

### <span style="color:DodgerBlue">Connect to mysql using a different container</span>

Now that MySQL is up and running, If we run another container on the same network, since each container has its own IP address, we can assiggn the same network to the new container we're about to create. In this case, we're going to make use of the nicolaka/netshoot container, which has a lot of tools that are useful for troubleshooting or debugging networking issues.

1. Start a new container using the nicolaka/netshoot image. Make sure to connect it to the same network.
```docker
docker run -it --network myapp nicolaka/netshoot
```
2. Inside the container, we're going to use the dig command, which is a useful DNS tool. We're going to look up the IP address for the hostname mysql.
```docker
dig mysql
```
The output :
```
; <<>> DiG 9.18.8 <<>> mysql
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32162
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mysql.             IN  A

;; ANSWER SECTION:
mysql.          600 IN  A   172.23.0.2

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11)
;; WHEN: Tue Oct 01 23:47:24 UTC 2019
;; MSG SIZE  rcvd: 44
```
In the "ANSWER SECTION", the `A` record for mysql that resolves to 172.23.0.2 while mysql isn't normally a valid hostname, Docker was able to resolve it to the IP address of the container that had that network alias `mysql`.
Which means, our app only simply needs to connect to a host named mysql and it'll talk to the database.

# <span style="color:orange">Running an application with MySQL as the database via the same network</span>

Few MySQL connection settings to consider are:   
 • MYSQL_HOST - the hostname for the running MySQL server   
 • MYSQL_USER - the username to use for the connection   
 • MYSQL_PASSWORD - the password to use for the connection   
 • MYSQL_DB - the database to use once connected

Note : using env vars to set connection settings is generally ok for development, it is highly not recommended when running applications in production. Many apps support env vars with a _FILE suffix to point to a file containing the variable. As an example, setting the MYSQL_PASSWORD_FILE var will cause the app to use the contents of the referenced file as the connection password.

<span style="color:DodgerBlue"> Lets Build our app, connecting to the already running mysql container:</span>
1. We'll specify each of the environment variables above, as well as connect the container to our app network.
```docker
docker run -dp 3000:3000 \
           -w /app \
           -v "$(pwd):/app" \ 
           --network myapp \
           -e MYSQL_HOST=mysql \
           -e MYSQL_USER=root \
           -e MYSQL_PASSWORD=secret \
           -e MYSQL_DB=myappdb \
           python:3.8-slim \
           py-mon /app/app.py
```
2. Open the app in your browser and add a few entries to your app.
3. Connect to the mysql database and check for the items that are being written to the database.
```docker
docker exec -it <mysql-container-id> mysql -p myappdb
```
4. In the MySQL shell, you can check if the data has been written to the concerned table.   

If you take a quick look at the Docker Dashboard, you'll see that we have two app containers running. But, there's no real indication that they are grouped together in a single app. 

At this point, we have an application that now stores its data in an external database running in a separate container. Know about container networking and also how service discovery can be performed using DNS.


# <span style="color:orange">Docker Compose</span>

We can share our application stacks in a much easier way and let others spin them up with a single and simple command!
Docker Compose is a tool that lets you define and run multi-container applications. A Docker Compose file is a YAML file that defines the services that make up your application. The file specifies the image to use for each service, the ports to expose, and the environment variables to set.

The big advantage of using docker-ompose is you can define your application stack in a file, keep it at the root of your project repo. It's now version controlled and thus easily enable someone else to contribute to your project. Someone would only need to clone your repo and start the compose app. 

## <span style="color:DodgerBlue"> Creating our Compose File</span>

Inside of the app folder, create a file named docker-compose.yml, next to the Dockerfile and myapp.py files. The command used to run the application is as follows:

```docker
docker run -dp 3000:3000 \
           -w /app \
           -v "$(pwd):/app" \ 
           --network myapp \
           -e MYSQL_HOST=mysql \
           -e MYSQL_USER=root \
           -e MYSQL_PASSWORD=secret \
           -e MYSQL_DB=myappdb \
           python:3.8-slim \
           py-mon /app/app.py
```

In the compose file, we'll start off by defining a list of services (or containers) we want to run as part of our application.
```docker
services:
```
And now, we'll start migrating a service at a time into the compose file.

<span style="color:DodgerBlue">Defining the App Service:</span>

1. First, let's define the service entry and the image for the container. We can pick any name for the service. The name will automatically become a network alias, which will be useful when defining our MySQL service.

```docker
services:
  app:
    image: python:3.8-slim
```
2. Adding the command function. The app service will use the python:3.8-slim image and will run the py-mon command with the /app/app.py file as an argument when it starts.
```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
```
3. Let's migrate the -p 3000:3000 part of the command by defining the ports for the service.
```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
```
4. Now, lets migrate both the working directory (-w /app) and the volume mapping (-v "$(pwd):/app") by using the working_dir and volumes definitions. 
```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
```
5. Finally, we need to migrate the environment variable definitions using the environment key.
```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
        MYSQL_HOST: mysql
        MYSQL_USER: root
        MYSQL_PASSWORD: secret
        MYSQL_DB: myappdb
```
<span style="color:DodgerBlue"> Defining the MySQL service for the application:</span>

Now, it's time to define the MySQL service. The command that we used for that container was the following:
```docker
docker run -d \
    --network myapp --network-alias mysql \
    -v myapp-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=myappdb \
    mysql:8.0
```

1. We will first define the new service and name it mysql so it automatically gets the network alias. We'll go ahead and specify the image to use as well.

```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
        MYSQL_HOST: mysql
        MYSQL_USER: root
        MYSQL_PASSWORD: secret
        MYSQL_DB: myappdb

  mysql:
    image: mysql:8.0
```
2. Next, we'll define the volume mapping. When we ran the container with docker run, the named volume was created automatically. However, that doesn't happen when running with Compose. We need to define the volume in the top-level volumes: section and then specify the mountpoint in the service config. By simply providing only the volume name, the default options are used.

```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
        MYSQL_HOST: mysql
        MYSQL_USER: root
        MYSQL_PASSWORD: secret
        MYSQL_DB: myappdb

  mysql:
    image: mysql:8.0
    volumes:
      - myapp-mysql-data:/var/lib/mysql

volumes:
  myapp-mysql-data:
```
3. Finally, we only need to specify the environment variables.

```docker
services:
  app:
    image: python:3.8-slim
    command: py-mon /app/app.py
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
        MYSQL_HOST: mysql
        MYSQL_USER: root
        MYSQL_PASSWORD: secret
        MYSQL_DB: myappdb

  mysql:
    image: mysql:8.0
    volumes:
      - myapp-mysql-data:/var/lib/mysql
    environment: 
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: myappdb

volumes:
  myapp-mysql-data:
```
At this point, the `docker-compose.yml` is complete

<span style="color:DodgerBlue">To start up the docker-compose.yml application</span>
```docker
docker-compose up -d
```
This would create and start two containers, the web service and the mysql service in the background (detachced mode). You can then access the web service at http://localhost:3000.

The volume was created as well as a network! By default, Docker Compose automatically creates a network specifically for the application stack which is why we didn't define one in the compose file.

Note: When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it. Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready before starting another container. For based projects, you can use the socket module.

<span style="color:DodgerBlue">To stop the docker-compose.yml application</span>
```docker
docker compose down
```
If you want to remove the volumes, you will need to add the --volumes flag. The Docker Dashboard does not remove volumes when you delete the app stack.