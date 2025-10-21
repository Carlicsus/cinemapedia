import 'package:dio/dio.dart'; 
import 'package:cinemapedia_220526/config/constants/environment.dart'; 
import 'package:cinemapedia_220526/domain/datasources/movies_datasource.dart'; 
import 'package:cinemapedia_220526/infraestructure/mappers/movie_mapper.dart'; 
import 'package:cinemapedia_220526/infraestructure/models/moviedb/moviedb_response.dart'; 
import 'package:cinemapedia_220526/domain/entities/movie.dart'; 

// En esta clase serà posible de sacar las películas directamente de la API de TheMovieDB
class MoviedbDatasource extends MoviesDatasource {
  // Creamos el cliente HTTP con la URL base y los parámetros comunes
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey, // Nuestra API key, generada que debe ser personal y no compartida
      'language': 'es-MX', // Idioma de la informacion
    },
  ));

  // Método que obtiene las películas que están en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // Hacemos la petición a la API
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    //  la respuesta se convierte a uun JSON en nuestro modelo
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // se hace el filtro de películas que tengan poster y las mapeamos a nuestra entidad Movie
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath.isNotEmpty)
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    print('Películas obtenidas: ${movies.length}'); // Esta linea solo se agrego para hacer un debug 

    return movies; // Devolvemos la lista lista para usar en la app
  }
}
