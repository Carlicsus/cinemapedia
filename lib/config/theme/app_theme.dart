import 'package:flutter/material.dart';


class AppTheme {

  // metodo que devuelve el tema principal colores, estilos, etc.
  ThemeData getTheme() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: const Color(0xFF2862F5) // Color principal de la app
  );

}
