import 'package:flutter/material.dart';
import 'pagina2.dart';
import 'clases.dart';

// ignore: must_be_immutable
class TarjetaP extends StatefulWidget {
  final Persona _person;
  Function(String) delete;

  TarjetaP(
    this._person,
    this.delete, {
    super.key,
  });

  @override
  State<TarjetaP> createState() => _TarjetaPState();
}

class _TarjetaPState extends State<TarjetaP> {
  String _administrador = "";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    widget._person.admin
        ? _administrador = 'ADMINISTRADOR'
        : _administrador = 'OPERARIO';

    index++;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
                widget._person.nombre,
                widget._person.celular,
                widget._person.profesion,
                widget._person.admin,
                widget._person.fecha),
          ),
        ).then(
          (value) {
            if (value != null) {
              setState(
                () {
                  widget._person.nombre = value['nombre'];
                  widget._person.celular = value['telefono'];
                  widget._person.fecha = value['fecha'].toString();
                  widget._person.admin = value['admin'];
                  if (widget._person.admin == true) {
                    _administrador = 'ADMINISTRADOR';
                  } else {
                    _administrador = "";
                  }
                },
              );
            }
          },
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 242, 243),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(137, 162, 161, 161),
                    offset: Offset(10.0, 10.0),
                  ),
                ],
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              height: 200.0,
              margin: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 100,
                            height: 150,
                            child: Image.asset(
                              'assets/avatar.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              widget._person.nombre,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              widget._person.fecha,
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            widget._person.profesion,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            height: 30.0,
                            child: Text(
                              'CEL: ${widget._person.celular}',
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            _administrador,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            widget.delete(widget._person.nombre);
                            print(widget._person.nombre);
                          },
                          icon: const Icon(Icons.delete),
                          color: const Color.fromARGB(255, 122, 0, 0),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
