// Clase que representa cómo vienen los datos de una película desde la API de MovieDB
class MovieMovieDB {
  // Constructor donde tenemos que pasar toda la info de la película
    MovieMovieDB({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    final bool adult;
    final String backdropPath;
    final List<int> genreIds;
    final int id;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final DateTime releaseDate;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

  // Método que convierte un JSON de la API a MovieMovieDB
    factory MovieMovieDB.fromJson(Map<String, dynamic> json) => MovieMovieDB(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? '',
        releaseDate: DateTime.parse(json["release_date"]), //convierte la fecha de estreno de texto a formato
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

// Método que convierte el objeto MovieMovieDB de vuelta a JSON
    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)), //convierte los géneros de la película de un JSON a una lista 
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}", //toma la fecha de Dart y la formatea para que sea entendible por otras apps o servicios que esperan "AAAA-MM-DD"
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
