import 'package:cinemapedia_220526/domain/entities/movie.dart';
import 'package:cinemapedia_220526/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider expone las películas que están en cartelera
// la app va a usar esto para escuchar la lista y actualizar la UI
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  // Atrae las películas del repositorio
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;

  //  el MoviesNotifier pasándole la función para traer películas
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

// Se define la la función que trae películas
typedef MovieCallback = Future<List<Movie>> Function({ int page });

// Notifier maneja el estado de la lista de películas
class MoviesNotifier extends StateNotifier<List<Movie>> {
  
  int currentPage = 0; // Página actual que hemos cargado
  MovieCallback fetchMoreMovies; // Función que trae más películas

  // Constructor: necesitamos pasar la función para traer películas
  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]); // Inicialmente la lista está vacía

  // Método para cargar la siguiente página de películas
  Future<void> loadNextPage() async{
    currentPage++; // Subimos la página
    final List<Movie> movies = await fetchMoreMovies( page: currentPage ); // Traemos más películas
    state = [...state, ...movies]; // Añadimos las nuevas al estado actual
  }

}
