import 'package:cinemapedia_220526/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_220526/presentation/widgets/movies/movie_slideshow.dart';
import 'package:cinemapedia_220526/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pantalla principal de la app
class HomeScreen extends StatelessWidget {

  static const name = 'home-screen'; // Nombre de la ruta para navegación

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold básico que muestra nuestro _HomeView
    return const Scaffold(
      body: _HomeView()
    );
  }
}

// Vista interna de la pantalla que necesita escuchar providers
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

// Estado de la vista, se maneja la lógica de carga de películas
class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    
    // Cuando se inicia la pantalla, cargamos la primera página de películas
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    // Se obtiene la lista de películas desde el provider
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

    // se muestrn las películas en un ListView simple
    return Column(
      children: [
       CustomAppbar(),
       MovieSlideshow(movies: nowPlayingMovies)
      ],
    );
  }
}
