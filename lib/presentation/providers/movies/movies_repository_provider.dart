import 'package:cinemapedia_220526/infraestructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220526/infraestructure/repositories/movie_repository_impl.dart';

// se expone un repositorio de películas, La idea es que la app pueda pedir películas desde cualquier parte
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDatasource() ); // Creamos el repo con el datasource de MovieDB
});
