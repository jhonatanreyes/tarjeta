import 'package:flutter/material.dart';
import 'package:tarjetas_retorno/widgets/details_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Person _person;

  DetailsScreen(this._person, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController ocupacionController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    nombreController.text = widget._person.name;
    ocupacionController.text = widget._person.description;
    telefonoController.text = widget._person.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: 'imageHero${widget._person.name}',
                      child: Image.asset(
                        'assets/ideaBoy.jpg',
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      widget._person.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 20,
                      child: Text(widget._person.description),
                    ),
                    Text(widget._person.phone),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                          label: Text('Nombre'),
                          // hintText: _person.name,
                          icon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextField(
                      controller: ocupacionController,
                      decoration: const InputDecoration(
                          label: Text('Ocupación'),
                          //hintText: widget._person.description,
                          icon: Icon(Icons.work),
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextField(
                      controller: telefonoController,
                      decoration: const InputDecoration(
                          label: Text('Teléfono'),
                          //hintText: widget._person.phone,
                          icon: Icon(Icons.phone_enabled),
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, '${widget._person.name}!!!');
                      },
                      child: const Text('Cancelar')),
                  
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
