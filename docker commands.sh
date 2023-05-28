PS C:\Users\sahee> docker

"""
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Log in to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information

Management Commands:
  builder     Manage builds
  buildx*     Docker Buildx (Docker Inc., v0.10.4)
  compose*    Docker Compose (Docker Inc., v2.17.3)
  container   Manage containers
  context     Manage contexts
  dev*        Docker Dev Environments (Docker Inc., v0.1.0)
  extension*  Manages Docker extensions (Docker Inc., v0.2.19)
  image       Manage images
  init*       Creates Docker-related starter files for your project (Docker Inc., v0.1.0-beta.4)
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  plugin      Manage plugins
  sbom*       View the packaged-based Software Bill Of Materials (SBOM) for an image (Anchore Inc., 0.6.0)
  scan*       Docker Scan (Docker Inc., v0.26.0)
  scout*      Command line tool for Docker Scout (Docker Inc., v0.10.0)
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Swarm Commands:
  swarm       Manage Swarm

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Global Options:
      --config string      Location of client config files (default
                           "C:\\Users\\sahee\\.docker")
  -c, --context string     Name of the context to use to connect to the
                           daemon (overrides DOCKER_HOST env var and
                           default context set with docker context use)
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug", "info",
                           "warn", "error", "fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "C:\\Users\\sahee\\.docker\\ca.pem")
      --tlscert string     Path to TLS certificate file (default
                           "C:\\Users\\sahee\\.docker\\cert.pem")
      --tlskey string      Path to TLS key file (default
                           "C:\\Users\\sahee\\.docker\\key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Run 'docker COMMAND --help' for more information on a command.

For more help on how to use Docker, head to https://docs.docker.com/go/guides/
"""





saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker --version
Docker version 23.0.5, build bc4487a

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker pull postgres
Using default tag: latest
latest: Pulling from library/postgres
Digest: sha256:31c9342603866f29206a06b77c8fed48b3c3f70d710a4be4e8216b134f92d0df
Status: Image is up to date for postgres:latest
docker.io/library/postgres:latest

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
postgres     latest    0c88fbae765e   4 days ago   379MB

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker run postgres
Error: Database is uninitialized and superuser password is not specified.
       You must specify POSTGRES_PASSWORD to a non-empty value for the
       superuser. For example, "-e POSTGRES_PASSWORD=password" on "docker run".

       You may also use "POSTGRES_HOST_AUTH_METHOD=trust" to allow all
       connections without a password. This is *not* recommended.

       See PostgreSQL documentation about "trust":
       https://www.postgresql.org/docs/current/auth-trust.html


saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
postgres     latest    0c88fbae765e   4 days ago   379MB

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker rmi 0c88f
Error response from daemon: conflict: unable to delete 0c88fbae765e (must be forced) - image is being used by stopped container 614e07efaa60

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker ps -a
CONTAINER ID   IMAGE      COMMAND                  CREATED         STATUS                     PORTS     NAMES
614e07efaa60   postgres   "docker-entrypoint.s…"   4 minutes ago   Exited (1) 4 minutes ago             bold_keller

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker stop 614e
614e

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker rm 614e
614e

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
postgres     latest    0c88fbae765e   4 days ago   379MB

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker rmi postgres
Untagged: postgres:latest
Untagged: postgres@sha256:31c9342603866f29206a06b77c8fed48b3c3f70d710a4be4e8216b134f92d0df
Deleted: sha256:0c88fbae765e8bcdb4c8974c73279e9c00b3bb5ab7e23131e40706430ef2bb2a
Deleted: sha256:18b526b5dcb36f8962ee736668dfb46647d7dc79b660ea9f0639afb11e53cc4f
Deleted: sha256:eb2e757a9d2bde0b17f95399d28d05db02d36bbd62e8b92e52980f8d0164fc6c
Deleted: sha256:c431d77a4b1b6777d1358d0357bba6d7e8de41349db60a772ad631bca2521dbb
Deleted: sha256:71b42321830a8136a386ab80d93211edb05109ccb5c7eb6ff2396c0fd92af59d
Deleted: sha256:9bc07483aa2aaae52c3c9a0ed7a3e63b4b11d8f1d7c9a181b3beba28c2c8b66a
Deleted: sha256:6924221877a441f8b2c551145f9606232b2b3b77b375b677a6375bb4db8aefc1
Deleted: sha256:d330f39e9e4fdfd86f7963238d82e6381e91bed0b4b249a32832a840b84e68bc
Deleted: sha256:75d34a65af7ea089b2e7afdcb5c7ffe2a018d5b07fbb3f30b2af0a1f06c92196
Deleted: sha256:69f968c7f08a036baf94c6b3b450e64b0159b7bc268d2193fa2686ac04b6bed0
Deleted: sha256:a0934333ea426c54ef8c58732541c08b72777249a8f4c1c6d74f9888507db8d1
Deleted: sha256:e3eb62bb6c049fde27e8f2bb4f8c49c6b33bcfa6db410465a807b5a9c80d0f2d
Deleted: sha256:7f74048287a78fdf193e31119dd5be9100aeba35b7321c674ec6f083e11a0ce3
Deleted: sha256:8cbe4b54fa88d8fc0198ea0cc3a5432aea41573e6a0ee26eca8c79f9fbfa40e3

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker ps -a
CONTAINER ID   IMAGE      COMMAND                  CREATED         STATUS                     PORTS     NAMES
614e07efaa60   postgres   "docker-entrypoint.s…"   5 minutes ago   Exited (1) 5 minutes ago             bold_keller

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

saheenpc@LAPTOP-K4H46N4U MINGW64 ~
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES






