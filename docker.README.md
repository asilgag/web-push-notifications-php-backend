Esta receta de docker crea en el _container_ un usuario con el mismo nombre y uid que el usuario local de nuestro equipo que está lanzando docker.

De esta forma, evitamos trabajar como _root_, con lo que los ficheros creados por docker serán propiedad de nuestro usuario local.

### Preparación del entorno (si ya se tiene instalado omitir)

* Instalar Docker  (https://docs.docker.com/engine/installation/) hay que ejecutar docker con nuestro usuario local para ello hay que asignar nuestro usuario al grupo "docker" para poder ejecutar docker sin sudo
```sh
sudo groupadd docker
sudo usermod -aG docker `whoami`
```
* Instalar docker-compose (https://docs.docker.com/compose/install/)

### Inicio (+info: alberto.silva@biko2.com)
Para que funcione, hay que definir un par de variables (mediante docker-set-enviroment.sh) antes de hacer el build de la imagen.
Además tenemos que añadir a nuestro hosts (/etc/hosts en linux /private/etc/hosts en mac) el dominio local que aparezca en docker/apache/default-ssl.conf en la línea 3 donde pone "ServerName", la ip a la que tiene que apuntar el dominio depende de si usamos un VM.
```sh
$ source docker-set-enviroment.sh
$ docker-compose build
$ docker-compose up
```
Una vez hecho el build, nos conectaremos al contenedor de una forma un poco distinta:
```sh
 $ docker exec -it {nombre_contenedor} su - `whoami`
```
### Comandos básicos

* Iniciamos los contenedores:
```sh
 $ docker-compose up
```
* Iniciamos los contenedores como servicio (daemon):
```sh
 $ docker-compose up -d
```
* Parar los contenedores:
```sh
 $ docker-compose stop
```
* Listamos los contenedores:
```sh
 $ docker ps -l
```
* Inpeccionamos contenedores (configuración básica e ip)
```sh
 $ docker inspect
```
* Conectar a un contenedor:
```sh
 $ sudo docker exec -i -t {nombre_contenedor} bash
```
* Conectar a un contenedor (especial de esta receta):
```sh
 $ docker exec -it {nombre_contenedor} su - `whoami`
```

### Base de datos
La base de datos va incluida, para importar una nueva en el contenedor
Obtenemos la ip del contenedor de mysql:
```sh
 $ docker inspect {nombre_contenedor_mysql} | grep IPAddress
```
Para conectar a la base de datos:
```sh
 $ mysql -uroot -proot -h{IP_CONTENEDOR} dmedicina
```
También podemos importala a través del phpmyadmin creado en el puerto 8081
