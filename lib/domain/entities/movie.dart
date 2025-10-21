// Clase que representa una película
class Movie {
  final bool adult; // Si la película es solo para adultos
  final String backdropPath; // Imagen de fondo de la película
  final List<String> genreIds; // lista de géneros 
  final int id; 
  final String originalLanguage; // Idioma original
  final String originalTitle; // Título original
  final String overview; // descripción
  final double popularity; 
  final String posterPath; // Ruta del póster de la película
  final DateTime releaseDate; // Fecha de estreno
  final String title; 
  final bool video; 
  final double voteAverage; // promedio de votos
  final int voteCount; // Número de votos

  // Constructor de la clase Movie
  // pasar todos los datos obligatorios para crear la película
  Movie({
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
    required this.voteCount
  });
}
