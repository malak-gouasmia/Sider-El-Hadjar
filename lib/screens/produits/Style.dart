// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProduitsText extends StatelessWidget {
  final String Titre;
  final String text;
  final Size screenSize;
  ProduitsText(
      {required this.Titre, required this.text, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$Titre\n',
          style: TextStyle(
              fontFamily: 'Electrolize',
              fontSize: screenSize.width < 800
                  ? screenSize.width / 30
                  : screenSize.width / 60,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
        Flexible(
          child: Container(
            width: screenSize.width * 0.5,
            child: Text(
              '$text\n',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: screenSize.width < 800
                    ? screenSize.width / 35
                    : screenSize.width / 75,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    );
  }
}
