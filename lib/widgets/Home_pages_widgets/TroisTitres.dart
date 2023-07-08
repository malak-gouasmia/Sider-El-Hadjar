// ignore_for_file: camel_case_types

import 'package:flutter_web/screens/GammeDeProduits.dart';
import 'package:flutter_web/screens/PolitiqueQualite.dart';
import 'package:flutter_web/screens/QuiSommeNous.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/responsive.dart';
import 'package:flutter/material.dart';

class troisTitres extends StatelessWidget {
  troisTitres({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/homePage/1.JPG',
    'assets/images/homePage/2.JPG',
    'assets/images/homePage/3.JPG',
  ];

  final List<String> titre = [
    'Qui somme nous ?',
    'Gamme de produits',
    'Notre Politique Qualité',
  ];

  final List<String> paragraphe = [
    'SIDER EL HADJAR, Complexe Sidérurgique situé à 12 km d’Annaba, couvrant une superficie de 832 hectares et possédant un effectif de 5144 agents.',
    '\n\n  Une large gamme de produits.',
    'Satisfaire les exigences de nos clients au moindre coût tel est le défi qu’entend mener la Direction Générale de SIDER EL HADJAR au quotidien.',
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.width * 0.05,
                              ),
                              child: Text(
                                titre[pageIndex],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: screenSize.width * 0.05,
                                  fontFamily: 'Electrolize',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.width * 0.01),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              child: Container(
                                height: 2,
                                width: screenSize.width * 0.3,
                                color: Color.fromARGB(255, 255, 1, 1),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.width / 20,
                              width: screenSize.width / 3.8,
                            ),
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.05,
                                  vertical: screenSize.width * 0.05),
                              child: Container(
                                // height: screenSize.width / 10,
                                width: screenSize.width / 1.5,
                                child: Text(
                                  paragraphe[pageIndex],
                                  style: TextStyle(
                                    // wordSpacing: 4,
                                    fontFamily: 'Electrolize',
                                    fontSize: screenSize.width / 27,
                                    color: Color.fromARGB(255, 20, 20, 20),

                                    fontWeight: FontWeight.w200,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.width * 0.04,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => pageIndex == 0
                                            ? QuiSommesNous()
                                            : pageIndex == 1
                                                ? GammeProduits()
                                                : PolitiqueQualite(),
                                      ));
                                },
                                child: Text(
                                  "En savoir plus ",
                                  style: TextStyle(
                                    //fontFamily: 'Electrolize',
                                    //fontSize:
                                    // screenSize.width * 0.02,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.width * 0.05,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.width * 0.02,
                        ),
                        child: Text(
                          titre[pageIndex],
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 22,
                            fontFamily: 'Electrolize',
                            // fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.width * 0.01),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        child: Container(
                          height: 2.5,
                          width: screenSize.width * 0.1,
                          color: Color.fromARGB(255, 255, 1, 1),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                        width: screenSize.width / 3.8,
                      ),
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  assets[pageIndex],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  color: Colors.grey.withOpacity(0.3),
                                )
                              ]),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Container(
                          height: screenSize.width / 15,
                          width: screenSize.width / 4,
                          child: Text(
                            paragraphe[pageIndex],
                            style: TextStyle(
                              // wordSpacing: 4,
                              fontFamily: 'Electrolize',
                              fontSize: screenSize.width / 70,
                              color: Color.fromARGB(255, 20, 20, 20),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pageIndex == 0
                                    ? QuiSommesNous()
                                    : pageIndex == 1
                                        ? GammeProduits()
                                        : PolitiqueQualite(),
                              ));
                        },
                        child: Text(
                          "En savoir plus",
                          style: TextStyle(
                            color: Colors.white,
                            //fontFamily: 'Electrolize',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
