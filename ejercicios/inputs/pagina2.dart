import 'package:flutter/material.dart';
import 'alertas.dart';

// ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  String nombres, fechaNac, telefono, profesion;
  bool admin;
  SecondPage(
      this.nombres, this.telefono, this.profesion, this.admin, this.fechaNac,
      {super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  late bool _value;
  String fecha1 = '';
  DateTime fecha = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nombreController.text = widget.nombres;
    _celularController.text = widget.telefono.toString();
    _value = widget.admin;
    fecha1 = widget.fechaNac;
    fecha = DateTime.parse(widget.fechaNac);
  }

  _onChange(value) {
    setState(() {
      _value = value;
    });
  }

  selectDate(BuildContext context) async {
    var picked = await showDatePicker(
      context: context,
      initialDate: fecha,
      firstDate: DateTime(1982),
      lastDate: DateTime(2024),
    );

    if (picked != null && fecha != picked) {
      setState(() {
        fecha = picked;
        fecha1 = '${fecha.year}-${fecha.month}-${fecha.day}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETALLE'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 200,
                    child: Image.asset(
                      'assets/avatar.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 300.0,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      controller: _nombreController,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 300.0,
                    height: 30.0,
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      controller: _celularController,
                      keyboardType: TextInputType.phone,
                      // decoration: const InputDecoration(
                      //   contentPadding:
                      //       EdgeInsets.only(left: 10.0, bottom: 15.0),
                      // ),
                      style: const TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Administrador'),
                      Switch(
                        value: _value,
                        onChanged: _onChange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(fecha1),
                      IconButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        icon: const Icon(Icons.date_range),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        ////// BOTON CANCELAR
                        onPressed: () {
                          Navigator.pop(context);
                          showSnackBar(context, false);
                        },

                        icon: const Icon(Icons.cancel),
                        label: const Text(
                          'CANCELAR',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                          iconColor: MaterialStatePropertyAll(Colors.white),
                          fixedSize: MaterialStatePropertyAll(Size(150, 40)),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      TextButton.icon(
                        //// BOTON ACTUALIZAR
                        onPressed: () {
                          showCupertinoAlert(
                            context,
                            'Desea Actualizar?',
                            'Esto modificara su información.',
                            _nombreController.text,
                            _celularController.text,
                            _value,
                            fecha1,
                          );
                        },
                        icon: const Icon(Icons.check_circle),
                        label: const Text(
                          'ACTUALIZAR',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                          iconColor: MaterialStatePropertyAll(Colors.white),
                          fixedSize: MaterialStatePropertyAll(Size(150, 40)),
                        ),
                      ),
                    ],
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
