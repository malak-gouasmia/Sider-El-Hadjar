//import 'dart:html';
// ignore_for_file: camel_case_types

import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';

import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class FORM extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<FORM> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 1;

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
      //key: _scaffoldKey,

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
                                AssetImage('assets/images/recrutement/1.JPG'),
                            //'assets/images/test/IMG_5472.png'
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 3
                                  : screenSize.width / 6,
                              left: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 40
                                  : screenSize.width / 20,
                            ),
                            child: Container(
                              color: Color.fromARGB(255, 255, 0, 0)
                                  .withOpacity(0.4),
                              child: Text(
                                'Recrutement',
                                style: TextStyle(
                                  letterSpacing: 4,
                                  fontFamily: 'Electrolize',
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? screenSize.width / 15
                                          : screenSize.width / 25,
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(-2, -2),
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        blurRadius: 2),
                                  ],
                                ),
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
                  /*********************************** */
                  SizedBox(
                    width: screenSize.width,
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.1
                        : screenSize.width * 0.2,
                  ),
                  SizedBox(
                    width: screenSize.width,
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.1
                        : screenSize.width * 0.2,
                  ),

                  /****************************** ***********************************************/

                  /****************************************************************************** */
                  BottomBar(screenSize: screenSize),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
