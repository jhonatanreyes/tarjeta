import 'package:flutter/material.dart';
import 'pagina1.dart';
import 'clases.dart';

void main() {
  runApp(const Tarjeta());
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjeta',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({
    super.key,
  });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Persona> _persons = [
    Persona('JHONATAN REYES', '3112777201', 'INGENIERO DE SISTEMAS', true,
        '1983-11-02'),
    Persona('ISABELLA REYES', '3112345677', 'ARTISTA', false, '2014-05-23'),
    Persona('LAURA BARRAGAN', '3152345693', 'CONTADORA PUBLICA', true,
        '2001-03-16'),
    Persona('MARY CORDOBA', '3182345632', 'COMERCIANTE', true, '1987-01-14')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void eliminar(String dato) {
      setState(() {
        _persons.removeWhere((item) => item.nombre == dato);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TARJETA DE PRESENTACION'),
      ),
      body: ListView(
        children: _persons.map((p) => TarjetaP(p, eliminar)).toList(),
      ),
    );
  }
}
