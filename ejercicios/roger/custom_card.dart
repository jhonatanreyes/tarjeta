import 'package:flutter/material.dart';
import 'package:tarjetas_retorno/Screens/details_screen.dart';
import 'package:tarjetas_retorno/widgets/details_widget.dart';

class CustomCard extends StatefulWidget {
  final Person _person;

  const CustomCard(
    this._person, {
    super.key,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 10,
          margin: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    width: 90,
                    child: Column(
                      children: [
                        Hero(
                          tag: 'imageHero${widget._person.name}',
                          child: Image.asset(
                            'assets/ideaBoy.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                        ),
                    const SizedBox(height: 20.0),
                    Text(widget._person.name, maxLines: 2, overflow: TextOverflow.ellipsis,),
                      
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40.0),
              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width*0.5,
                padding: EdgeInsets.only(right: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Text(widget._person.description),
                    ),
                    Row(
                      children: [
                        Text(widget._person.phone),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(widget._person),
                              ),
                            ).then((value) {
                              setState(() {
                                widget._person.name = value;
                              });
                            });
                          },
                          child: const Text('Editar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 30, top: 30),
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}
