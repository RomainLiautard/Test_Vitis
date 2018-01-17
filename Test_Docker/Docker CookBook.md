# Docker Cookbook
***
## *Summary*
* Link to
[Markdown command](https://sourceforge.net/p/pranucook/wiki/markdown_syntax/)
from SourceForge

### How to install
##### For Windows
> To install docker on windows simply go on Docker main page and download the
windows installer.

#### For Linux
> Type the following commands

  >     some commands...

#### Main commands
* ##### Start an container


#### Containers
* ###### Show images
> If you wish to know all installed image simply enter :
```
docker images
```
* ###### Show comtainer
> You can check your running container(s) by typing :
```
docker container ls
```
 * or `ls -a` to display all containers.

 > You can also type :
 ```
 docker ps
 ```
 * Yes `ps -a` will display all containers.


 * ###### Intall Container
 > You can easely add container with the `pull` command
  * ex :
  >
 ```
 docker pull debian
 ```
###### notes :
  * If you don't specify which a version, docker will look for the so-called
  *lasted* default version of a container.

 * ###### Build container (commad only)
> Build your own container from a Dockerfile with :

  > ###### Warning
  * This method will work only if you are inside ( *cd* ) the Dockerfile folder.  
  * Keep in mind that you CAN'T have multiple builds with same name.

  > ```
docker build -t NAME .
```
###### notes :
  * `NAME` represent a tag you give for calling a container.
  * Don't forget the `.` at the end.

* ###### Start container
> They are two way to do that. First by using `run` and the second by using `start`.
###### Using `Run`
This commad is use when it's the first time you try an image. It will ALWAYS create a new image's container and start it.
```
docker run [OPTION] IMAGE
```
> You'll mostly use the following command :
```
docker run --name NAME -it CONTAINER
```
###### notes :
  * `NAME` represent a tag you give for calling a container
  * `CONTAINER` is the name of the build you wanna run

  > ###### Using `Start`
  To access an existing container where you left it or a running one use the following command :
  ```
  docker start -ai NAME
  ```
  ###### notes :
    * `NAME` represent a tag you give for calling a container
    * `-a` Attach STDOUT/STDERR and forward signals
    * `-i` Attach container's STDIN

* ###### Start container with a shared directory
 > To map a host directory to a docker container directory you need to use the `-v` flag when using docker run like so: 
 ```
docker run -v /host/dir:/container/dir -other -options image_name command_to_run
```

* ###### Push image
> * ###### Pre-setup

  > In order to push on the Docker Hub, the image name must be like `<hub-user>/<repo-name>[:<tag>]`. If it’s not specified, the tag defaults to `latest`. You can name your local images either when you build it, using docker,
```
build -t <hub-user>/<repo-name>[:<tag>]
```
by re-tagging an existing local image,
```
docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]
```
or by using
```
docker commit <exiting-container> <hub-user>/<repo-name>[:<tag>]
```
to commit changes.
> * ###### Push command

  > To push an image on the Docker Hub, use the following command :
  ```
  docker push <hub-user>/<repo-name>[:<tag>]
  ```
