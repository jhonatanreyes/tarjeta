import 'package:flutter/material.dart';

void main() {
  runApp(const Tarjeta());
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjeta',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TARJETA DE PRESENTACION'),
        ),
        body: Row(
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
                              child: const Text(
                                'JHONATAN REYES MARTINEZ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                              child: const Text(
                                'INGENIERO DE SISTEMAS Y PIANISTA',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                  child: const Center(
                                    child: Text(
                                      'CEL: 3112777201',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
      ),
    );
  }
}
