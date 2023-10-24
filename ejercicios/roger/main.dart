import 'package:flutter/material.dart';
import 'package:tarjetas_retorno/Screens/home_screen.dart';
//import 'package:tarjetas_retorno/widgets/details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasar parametros Rutas Nombradas',
      routes: {
        'home': (context) => HomeScreen(),
      },
      initialRoute: 'home',
    );
  }
}

