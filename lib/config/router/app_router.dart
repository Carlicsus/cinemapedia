import 'package:go_router/go_router.dart';
import 'package:cinemapedia_220526/presentation/screens/screens.dart';

// Configuración del router de la applicacion
final appRouter = GoRouter(
  initialLocation: '/', // La pantalla inicial cuando abres la app
  routes: [
    
    // Ruta de la pantalla de inicio
    GoRoute(
      path: '/', 
      name: HomeScreen.name, // ruta para referenciarla más fácil
      builder: (context, state) => const HomeScreen(), // Qué pantalla mostrar cuando se accede
    ),

  ]
);
