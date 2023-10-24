import 'package:flutter/material.dart';

void main() {
  runApp(const Botones());
}

class Botones extends StatefulWidget {
  const Botones({
    super.key,
  });

  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  int valor = 0;
  Color color = Colors.black;
  bool dato = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addValue = () => {
          setState(() {
            valor--;
          })
        };

    return MaterialApp(
      title: 'BOTONES',
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              dato = !dato;
              dato
                  ? color = const Color.fromARGB(255, 177, 8, 8)
                  : color = const Color.fromARGB(255, 62, 83, 238);
            });
          },
          backgroundColor: const Color.fromARGB(255, 8, 177, 30),
          child: const Icon(Icons.palette),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              color,
              Colors.white,
            ],
          )),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'CONTADOR',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$valor',
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      addValue,
                      const Icon(Icons.access_alarm),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          valor++;
                        });
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(5.0)),
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          valor = 0;
                        });
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(5.0)),
                      child: const Icon(Icons.cleaning_services),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          valor--;
                        });
                      },
                      style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(5.0)),
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback myFunction;

  const CustomButton(this.myFunction, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: myFunction,
      style: const ButtonStyle(elevation: MaterialStatePropertyAll(5.0)),
      child: icon,
    );
  }
}
