import 'package:flutter/material.dart';

void main() {
  runApp(const Tarjeta());
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tarjeta',
      home: FirstPage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int telefono;
  final String nombres;
  const SecondPage(this.telefono, this.nombres, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETALLE'),
      ),
      body: Row(
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
              Text(
                nombres,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
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
                child: Text(
                  telefono.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TARJETA DE PRESENTACION'),
      ),
      body: const Column(
        children: [
          TarjetaP(
              'JHONATAN REYES', 3112777201, 'INGENIERO DE SISTEMAS Y PIANISTA'),
          TarjetaP('ISABELLA REYES', 3156234563, 'DIRECTORA DE ARTE Y CULTURA'),
          TarjetaP('LAURA REYES', 3152365423, 'CONTADORA PUBLICA'),
        ],
      ),
    );
  }
}

class TarjetaP extends StatelessWidget {
  final String nombre, descripcion;
  final int celular;

  const TarjetaP(
    this.nombre,
    this.celular,
    this.descripcion, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(celular, nombre),
          ),
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
                          flex: 4,
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
                              nombre,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
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
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 40.0),
                            child: Text(
                              descripcion,
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                width: 150.0,
                                height: 30.0,
                                child: Center(
                                  child: Text(
                                    'CEL: $celular',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
