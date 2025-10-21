import 'package:cinemapedia_220526/domain/entities/movie.dart';
import 'package:cinemapedia_220526/infraestructure/models/moviedb/movie_moviedb.dart';

// la clasee que se encarga de convertir los datos de MovieDB a nuestro modelo llaamado Movie
class MovieMapper {
  
  // va a recibir  un MovieMovieDB y devuelve nuestra Movie
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') // si no tiene imagen de fondo, se coloca una por default
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      // Convertimos los IDs de género a string
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }' //Si tiene in poster se coloca
        : 'no-poster', //Sino lo tiene por eso se utiliz el no-poster, este de esta linea
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}
