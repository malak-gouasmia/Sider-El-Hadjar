// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/responsive.dart';
import 'Style.dart';

class FicheTechnique extends StatelessWidget {
  const FicheTechnique({
    Key? key,
    required this.screenSize,
    required this.image,
    required this.NomProduit,
    required this.titre,
    required this.text,
  }) : super(key: key);

  final Size screenSize;
  final String image;
  final String NomProduit;
  final List<String> titre;
  final List<String> text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width * 0.05
              : screenSize.width * 0.05,
          vertical: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width * 0.16
              : screenSize.width * 0.14,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width * 0.05
                  : screenSize.width * 0.03,
              vertical: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width * 0.05
                  : screenSize.width * 0.05,
            ),
            child: Column(children: [
              SizedBox(width: screenSize.width),
              Container(
                child: Text1(screenSize: screenSize, NomProduit: NomProduit),
              ),
              SizedBox(
                height: screenSize.width * 0.01,
                width: screenSize.width,
              ),
              Container(
                color: Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                height: screenSize.width * 0.002,
                width: screenSize.width * 0.6,
              ),
              SizedBox(
                height: screenSize.width * 0.03,
                width: screenSize.width,
              ),
              ResponsiveWidget.isSmallScreen(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...Iterable<int>.generate(titre.length).map(
                                  (int Index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: ProduitsText(
                                          text: text[Index],
                                          Titre: titre[Index],
                                          screenSize: screenSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              image,
                              width: screenSize.width * 0.55,
                              height: screenSize.width * 0.45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ])
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...Iterable<int>.generate(titre.length).map(
                              (int Index) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ProduitsText(
                                      text: text[Index],
                                      Titre: titre[Index],
                                      screenSize: screenSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          image,
                          width: screenSize.width * 0.3,
                          height: screenSize.width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
            ]),
          ),
        ),
      ),
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({
    Key? key,
    required this.screenSize,
    required this.NomProduit,
  }) : super(key: key);
  final String NomProduit;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Fiche Technique',
        style: TextStyle(
            letterSpacing: 2,
            fontFamily: 'Electrolize',
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 30
                : screenSize.width / 40,
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
      Text(
        '\n$NomProduit ',
        style: TextStyle(
            fontFamily: 'Electrolize',
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 30
                : screenSize.width / 50,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
