# CINEMAPEDIA

## Tabla de Contenido

- [CINEMAPEDIA](#cinemapedia)
  - [Tabla de Contenido](#tabla-de-contenido)
  - [Descripcion del Proyecto](#descripcion-del-proyecto)
  - [fuentes utilizadas para API](#fuentes-utilizadas-para-api)
  - [Funcionalidades](#funcionalidades)
  - [Tecnologias](#tecnologias)


***
## Descripcion del Proyecto
**Cinemapedia** es un proyecto que permite consultar informacion acerca de las peliculas que de momento se encuentren en **cine**, **proximamente**, **populares** y **mas valoradas** segun 

- **Inicio** : podemos ver las peliculas segun su categoria: En cine, UpComing, Populares y TopRated.
- **Boton de busqueda**: permite buscar y encontrar las peliculas que el usuario desee.
- **AppBar**: encontramos botones botones como "Inicio" que te re dirige al home, Categorias y Favoritos que te permite añadir y almacenar las peliculas de preferencia del usuario.
## fuentes utilizadas para API
Peticiones HTTP / https://www.themoviedb.org/.


***
## Funcionalidades
<!-- 🛠️ Proyecto en Construccion 🛠️ -->

En base a la estructura del proyecto, logramos crear la carpeta **config** que es donde tenemos nuestras variables de entorno, incluyendo la configuracion de rutas (app_router) donde utilizamos *Go_Router* para el enrutamiento y/o direccionamiento entre diferentes pantallas dentro de la aplicacion, siendo mas flexible y facil de usar.
En la carpeta de **domain** tenemos el datasources (origen de los datos), entidades y repositorios (permite el acceso al datasource).
En **infrastructure** tenemos las implementaciones del datasource donde se realiza la peticion HTTP que me permite obtener la informacion de la fuente de datos, tanto de las peliculas como de los actores.
En la carpeta de **presentation** esta la implementacion de los widgets que compone el proyecto.
Al inicio de la aplicacion implementamos un CustomAppbar que compone el titulo de la aplicacion con su respectivo icono y el IconButton (busqueda) que implementa un showSearch para obtener los resultados de busqueda por el usuario, en este caso las peliculas.
En el home_view encontramos los widgets que componen la vista inicial. El primer carrusel de peliculas se utilizo un Swiper y SwiperPagination, seguido del CustomScrollView utilizando el widget SliverList con sus respectivos HorizontalListView (scroll horizontal de peliculas).
Finalmente tenemos el CustomBottonNavigation compuesto por tres widgets que son Inicio, Categorias (en construccion 🔨) y Favoritos. Podemos seleccionar cualquier pelicula y ver informacion como descripcion general, foto de portada y los actores que hacen parte de la pelicula (toda la informacion obtenida por el gestor de peticiones http *dio: ^5.3.3*). En Favoritos, el usuario puede almacenar sus peliculas dando click al boton de favorite y automaticamente cambiara su estado, almacenando la pelicula en la base de datos local (base de datos utilizada: Isar database). Sin embargo el usuario puede remover la pelicula de Favoritos gracias al FutureProvider que me proporciona el gestor de estados.
El uso de los providers que me proporciona RIVERPOD (Provider-StateNotifierProvider-Notifier,FutureProvider,etc) fue  fundamental para la construccion de la aplicacion.

***
## Tecnologias
Tecnologias que se utilizaron en el proyecto:
- Flutter 3.16.6
- Dart 3.2.3
- Xcode 15.2
- iOS 17.0

**Environment**
- SDK: >= 3.1.5 <4.0.0

**Dependencies**
- animate_do: ^3.1.2
- card_swiper: ^3.0.1
- dio: ^5.3.3
- flutter_dotenv: ^5.1.0
- flutter_riverpod: ^2.4.8
- flutter_staggered_grid_view: ^0.7.0
- go_router: ^12.1.1
- intl: ^0.18.1
- isar: ^3.1.0+1
- isar_flutter_libs: ^3.1.0+1
- path_provider: ^2.1.2

**dev_dependencies**
- build_runner: ^2.4.8
- flutter_lints: ^2.0.0
- isar_generator: ^3.1.0+1
  
****

![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/cinemapedia1.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/cinemapedia2.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/cinemapedia3.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/appbar5.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/search6.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/favorite4.gif)


![Cinemapedia](https://github.com/JuanBueno21/cinemapedia/blob/main/cinemapedia/demo/addFavorites.gif)





