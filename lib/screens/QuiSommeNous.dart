//import 'dart:html';
// ignore_for_file: camel_case_types

import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class QuiSommesNous extends StatefulWidget {
  @override
  _NousState createState() => _NousState();
}

class _NousState extends State<QuiSommesNous> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0.6;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.08 ? 1 : 0.7;

    return Scaffold(
      /***************** */
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < 800
          ? AppBar(
              iconTheme:
                  IconThemeData(color: Color.fromARGB(255, 253, 253, 253)),
              elevation: 0,
              backgroundColor:
                  Color.fromARGB(255, 0, 0, 0).withOpacity(_opacity),
              centerTitle: true,
              title: myRow())
          : PreferredSize(
              preferredSize: Size(screenSize.width, 150),
              child: _scrollPosition > screenSize.height * 0.08 ||
                      screenSize.height < 150
                  ? Container(
                      width: screenSize.width,
                      child: TopBarContents(_opacity),
                    )
                  : Column(children: [
                      ENTETE(opacity: _opacity, screenSize: screenSize),
                      TopBarContents(_opacity),
                    ]),
            ),
      drawer: MenuDrawer(),
      /********************************************** */
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0
                        : screenSize.height * 0.1,
                  ),
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0
                        : screenSize.height * 0.1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/quiSommesNous/1.JPG'),
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 3
                                  : screenSize.width / 5,
                              left: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 40
                                  : screenSize.width / 20,
                            ),
                            child: Text(
                              'Qui sommes-nous ? ',
                              style: TextStyle(
                                letterSpacing: 4,
                                fontFamily: 'Electrolize',
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? screenSize.width / 15
                                        : screenSize.width / 25,
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(-2, -2),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 10
                                  : screenSize.width / 20,
                              left: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 40
                                  : screenSize.width / 20,
                            ),
                            child: Text(
                              "Sider , complexe siderurgique  d'el-hajar.",
                              style: TextStyle(
                                letterSpacing: 2,
                                fontFamily: 'Electrolize',
                                fontSize: screenSize.width < 800
                                    ? screenSize.width / 25
                                    : screenSize.width / 30,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(-2, -2),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width,
                            height: ResponsiveWidget.isSmallScreen(context)
                                ? screenSize.width * 0.1
                                : screenSize.width * 0.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    color: Color.fromARGB(255, 196, 196, 196).withOpacity(0.75),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.width < 800
                              ? screenSize.width / 30
                              : screenSize.height / 20,
                          horizontal: screenSize.width / 30),
                      child: ResponsiveWidget.isSmallScreen(context)
                          ? Column(
                              children: [
                                partie1(screenSize: screenSize),
                                SizedBox(
                                  height: screenSize.width / 2.5,
                                  width: screenSize.width / 1.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.asset(
                                      'assets/images/quiSommesNous/2.JPG',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                partie1(screenSize: screenSize),
                                Flexible(
                                  child: Image.asset(
                                    'assets/images/quiSommesNous/2.JPG',
                                    width: screenSize.width * 0.4,
                                    height: screenSize.height * 0.6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    color: Color.fromARGB(255, 196, 196, 196).withOpacity(0.6),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.width < 800
                              ? screenSize.width / 30
                              : screenSize.height / 20,
                          horizontal: screenSize.width / 30),
                      child: ResponsiveWidget.isSmallScreen(context)
                          ? Column(
                              children: [
                                partie2(screenSize: screenSize),
                                SizedBox(
                                  height: screenSize.width / 2.5,
                                  width: screenSize.width / 1.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.asset(
                                      'assets/images/quiSommesNous/3.JPG',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Image.asset(
                                    'assets/images/quiSommesNous/3.JPG',
                                    width: screenSize.width * 0.4,
                                    height: screenSize.height * 0.6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                partie2(screenSize: screenSize),
                              ],
                            ),
                    ),
                  ),
                  BottomBar(
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class partie1 extends StatelessWidget {
  const partie1({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 50
                : screenSize.width / 15,
            left: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 50
                : screenSize.width / 20,
          ),
          child: Container(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.85
                : screenSize.width / 3,
            child: Text(
              'SIDER EL HADJAR, Complexe Sidérurgique d’El-Hadjar, filiale du groupe IMETAL, '
              ' placé sous la tutelle du Ministère de l’industrie et des Mines.',
              style: TextStyle(
                  //letterSpacing: 4,
                  fontFamily: 'Electrolize',
                  fontSize: screenSize.width < 800
                      ? screenSize.width / 30
                      : screenSize.width / 60,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenSize.width < 800
                  ? screenSize.width / 15
                  : screenSize.height / 10,
              left: screenSize.width / 20),
          child: Container(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width
                : screenSize.width / 2.5,
            child: Text(
              '• Situé à 12 km de Annaba\n\n'
              '• Superficie : 832 hectares.\n\n'
              '• Capacité de production : 1.2 Million de tonnes de produits sidérurgiques. \n\n'
              '• Effectif : 5144 ( CDI = 3536, CDD = 1090, CTA = 518 ) .\n\n'
              '• Le complexe dispose de ses propres installations maritimes reliées au réseau ferroviaires pour le transport des matières premières et les expéditions des produits finis.\n\n'
              '• Le complexe dispose d’un réseau commercial à travers le pays de 07 points de vente.\n\n',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: screenSize.width < 800
                    ? screenSize.width / 35
                    : screenSize.width / 75,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
              textAlign:
                  screenSize.width < 800 ? TextAlign.center : TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}

class partie2 extends StatelessWidget {
  const partie2({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 50
                : screenSize.width / 15,
            left: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 50
                : screenSize.width / 20,
          ),
          child: Container(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.85
                : screenSize.width / 3,
            child: Text(
              'Unités de production du Complexe Sidérurgique d’El-Hadjar ',
              style: TextStyle(
                  fontFamily: 'Electrolize',
                  fontSize: screenSize.width < 800
                      ? screenSize.width / 30
                      : screenSize.width / 60,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenSize.width < 800
                  ? screenSize.width / 15
                  : screenSize.height / 10,
              left: screenSize.width / 20),
          child: Container(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width
                : screenSize.width / 2.5,
            child: Text(
              '• Haut Fourneau 2\n\n'
              '• Unité de Préparation de Matières Première et Aggloméré\n\n'
              '• Aciérie Oxygène 1\n\n'
              '• Aciérie Oxygène 2\n\n'
              '• Aciérie Électrique\n\n'
              '• Laminoir à Chaud\n\n'
              '• Laminoir à Froid\n\n'
              '• Unité de Galvanisation\n\n'
              '• Laminoir Rond Béton\n\n',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: screenSize.width < 800
                    ? screenSize.width / 35
                    : screenSize.width / 75,
                color: Color.fromARGB(255, 20, 20, 20),
                //fontWeight: FontWeight.bold
              ),
              textAlign:
                  screenSize.width < 800 ? TextAlign.center : TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ResponsiveWidget.isSmallScreen(context)
            ? screenSize.width / 3
            : screenSize.width / 6,
        left: ResponsiveWidget.isSmallScreen(context)
            ? screenSize.width / 40
            : screenSize.width / 20,
      ),
      child: Text(
        'Qui sommes-nous ? ',
        style: TextStyle(
            letterSpacing: 4,
            fontFamily: 'Electrolize',
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 15
                : screenSize.width / 30,
            color: Color.fromARGB(255, 255, 0, 0),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
