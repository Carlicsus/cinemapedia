import 'package:cinemapedia_220526/domain/entities/movie.dart';

abstract class MoviesDatasource {

  // obtiene las películas que están en cartelera, por medio de una lista de películas 
  Future<List<Movie>> getNowPlaying({ int page = 1 });
}
