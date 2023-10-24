import 'package:flutter/material.dart';
import 'package:tarjetas_retorno/widgets/custom_card.dart';
//import 'package:tarjetas_retorno/main.dart';
import 'package:tarjetas_retorno/widgets/details_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Person> _persons = [
    Person('Anderson Rodriguez', 'Soy Desarrollador', '3212312'),
    Person('Pancho', 'Soy Pintor', '5456232'),
    Person('Juan', 'Soy Tecnico', '98877')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          children: _persons.map((p) => CustomCard(p)).toList(),
        ),
      ),
    );
  }
}
