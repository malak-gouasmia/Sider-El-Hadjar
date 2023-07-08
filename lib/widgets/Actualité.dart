import 'package:flutter/material.dart';
import 'package:flutter_web/screens/Aclualite.dart';

class ACTUALITE extends StatelessWidget {
  ACTUALITE({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/a.jpg',
    'assets/images/6.jpg',
    'assets/images/2.jpg',
  ];

  final List<String> title = ['SIDER1', 'SIDER2', 'SIDER3'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 225, 222, 216),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.width < 800
              ? screenSize.width * 0.06
              : screenSize.width * 0.03,
          horizontal: screenSize.width < 800
              ? screenSize.width * 0.05
              : screenSize.width * 0.05,
        ),
        child: screenSize.width < 800
            ? Column(
                children: [
                  TitreActualite(screenSize: screenSize),
                  TexteActualite(screenSize: screenSize),
                  SizedBox(
                    height: screenSize.width * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      'assets/images/homePage/actualite.jpg',
                      width: screenSize.width * 0.45,
                      height: screenSize.width * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.03,
                    width: screenSize.width,
                  ),
                  ButtonActualite(screenSize: screenSize),
                ],
              )

            /************************************************************************************************* */

            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                      color: Colors.black,
                      height: screenSize.width * 0.35,
                      width: screenSize.width * 0.008,
                    ),
                    SizedBox(width: screenSize.width * 0.1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitreActualite(screenSize: screenSize),
                        TexteActualite(screenSize: screenSize),
                        SizedBox(
                          height: screenSize.width * 0.03,
                        ),
                        ButtonActualite(screenSize: screenSize),
                      ],
                    ),
                    SizedBox(width: screenSize.width * 0.1),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'assets/images/homePage/actualite.jpg',
                        width: screenSize.width * 0.25,
                        height: screenSize.width * 0.23,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
      ),
    );
  }
}

class ButtonActualite extends StatelessWidget {
  const ButtonActualite({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 26, 26, 26),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Actualites()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 2),
        child: Text(
          "Parcourir",
          style: TextStyle(
            //fontFamily: 'Electrolize',
            fontSize: screenSize.width < 800
                ? screenSize.width * 0.04
                : screenSize.width * 0.017,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TexteActualite extends StatelessWidget {
  const TexteActualite({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width < 800
          ? screenSize.width * 0.7
          : screenSize.width * 0.35,
      child: Text(
        " \nSuivre l'actualité de SIDER EL-HADJAR et etre au courant des événements les plus importantes et de nos  dernières activités",
        style: TextStyle(
          fontFamily: 'Electrolize',
          wordSpacing: 2,
          fontSize: screenSize.width < 800
              ? screenSize.width / 30
              : screenSize.width / 65,
          color: Color.fromARGB(223, 0, 0, 0),
          fontWeight: FontWeight.w800,
        ),
        textAlign:
            screenSize.width < 800 ? TextAlign.justify : TextAlign.justify,
      ),
    );
  }
}

class TitreActualite extends StatelessWidget {
  const TitreActualite({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Actualités',
      textAlign: TextAlign.right,
      style: TextStyle(
        letterSpacing: 4,
        fontFamily: 'Electrolize',
        // fontFamily: 'Montserrat',
        fontSize: screenSize.width < 800
            ? screenSize.width / 15
            : screenSize.width / 25,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(-2, -2),
            color: Colors.blueGrey,
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
