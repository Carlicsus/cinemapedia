import 'package:cinemapedia_220526/domain/entities/movie.dart';

// Clase quen representa el repositorio de películas
// es el lugar donde pedimos asi vengan de internet, base de datos o cualquier otra parte
abstract class MoviesRepository {
  // Método para obtener las películas que están en cartelera
  Future<List<Movie>> getNowPlaying({ int page = 1 });

}