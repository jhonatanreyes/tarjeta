import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showCupertinoAlert(
    BuildContext context, titulo, mensaje, nombre, celular, admin, fecha) {
  var alertDialog = CupertinoAlertDialog(
    title: Text(titulo),
    content: Text(mensaje),
    actions: [
      CupertinoButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: const Text('No'),
      ),
      CupertinoButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: const Text('Si'),
      )
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => alertDialog,
  ).then((value) {
    if (value) {
      Navigator.pop(context, {
        'nombre': nombre,
        'telefono': celular,
        'admin': admin,
        'fecha': fecha,
      });
      showSnackBar(context, true);
    } else {
      showSnackBar(context, false);
      Navigator.pop(context);
    }
  });
}

///////////////////////////////////////////////SNACK BAR
///////////////////////////////////////////////SNACK BAR
///////////////////////////////////////////////SNACK BAR
///
void showSnackBar(context, status) {
  if (status) {
    var snackBar = const SnackBar(
      content: Center(
        child: Text(
          'CAMBIOS REALIZADOS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    var snackBar = const SnackBar(
      content: Center(
        child: Text(
          'EDICION CANCELADA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(180, 255, 0, 0),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
