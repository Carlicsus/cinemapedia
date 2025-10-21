import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {

  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
  //En esta parte va la apikye, que se genera en the movie db 
}