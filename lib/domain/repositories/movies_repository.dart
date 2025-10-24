import 'package:cinemapedia_220526/domain/entities/movie.dart';


abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

}