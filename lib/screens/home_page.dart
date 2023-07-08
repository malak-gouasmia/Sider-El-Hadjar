//import 'dart:html';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/TroisTitres.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../widgets/Actualité.dart';
import '../widgets/Home_pages_widgets/carousel.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      /************************************************/
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0.08
                        : screenSize.height * 0.2,
                  ),
                  MainCarousel(),
                  ResponsiveWidget.isSmallScreen(context)
                      ? SizedBox(
                          height: screenSize.height * 0.02,
                        )
                      : Container(),
                  Container(
                    height: screenSize.height * 0.009,
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.8
                        : screenSize.width,
                    color: Color.fromARGB(255, 57, 55, 55),
                    padding: EdgeInsets.only(
                      top: screenSize.height / 16,
                      bottom: screenSize.height / 30,
                    ),
                  ),
                  ACTUALITE(screenSize: screenSize),
                  Container(
                    height: screenSize.height * 0.009,
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.8
                        : screenSize.width,
                    color: Color.fromARGB(255, 198, 7, 7),
                    padding: EdgeInsets.only(
                      top: screenSize.height / 16,
                      bottom: screenSize.height / 30,
                    ),
                  ),
                  troisTitres(screenSize: screenSize),
                  //SizedBox(height: screenSize.height / 10),
                  SizedBox(height: screenSize.height / 10),
                  BottomBar(
                    screenSize: screenSize,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
