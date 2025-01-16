import 'package:flutter/material.dart';

class Exemple extends StatelessWidget {
  const Exemple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exemple de Police Lato',
              style: TextStyle(fontFamily: 'Lato')),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Lato Regular', style: TextStyle(fontFamily: 'Lato')),
              Text('Lato Bold',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.bold)),
              Text('Lato Italic',
                  style: TextStyle(
                      fontFamily: 'Lato', fontStyle: FontStyle.italic)),
              Text('Lato Bold Italic',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
              Text('Lato Light',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.w300)),
              Text('Lato Light Italic',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic)),
              Text('Lato Black',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.w900)),
              Text('Lato Black Italic',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic)),
              Text('Lato Thin',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.w100)),
              Text('Lato Thin Italic',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
