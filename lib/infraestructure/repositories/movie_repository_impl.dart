import 'package:cinemapedia_220526/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220526/domain/entities/movie.dart';
import 'package:cinemapedia_220526/domain/repositories/movies_repository.dart';

// lo que la app realmente usa para pedir películas
class MovieRepositoryImpl extends MoviesRepository {

  // Guardamos la fuente de datos que nos dará las películas
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  // Método que obtiene las películas en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

}
