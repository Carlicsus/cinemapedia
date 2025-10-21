import 'package:flutter/material.dart';
import 'package:cinemapedia_220526/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemapedia_220526/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220526/presentation/screens/movies/home_screen.dart';

// Punto de entrada de la app
Future<void> main() async {
  // Se cargan las variables del archivo .env (como la API key)
  await dotenv.load(fileName: '.env');
  
  // Inicia la app con ProviderScope para que Riverpod funcione
  runApp(const ProviderScope(child: MyApp()));
}

// Clase principal de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Se equita la etique del debug
      theme: AppTheme().getTheme(), // Se aplica el tema seleccionado 
      home: const HomeScreen(), // Pantalla inicial
    );
  }
}
