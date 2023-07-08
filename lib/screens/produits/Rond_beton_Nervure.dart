//import 'dart:html';
// ignore_for_file: camel_case_types

import 'package:flutter_web/screens/produits/FicheTechnique.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/Home_pages_widgets/top_bar_contents.dart';

import 'data.dart';

class Rond_beton_Nervure extends StatefulWidget {
  @override
  _Rond_beton_NervureState createState() => _Rond_beton_NervureState();
}

class _Rond_beton_NervureState extends State<Rond_beton_Nervure> {
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
        child: Stack(children: [
          Container(
            child: Container(
              child: Column(
                children: [
                  FicheTechnique(
                    screenSize: screenSize,
                    image: images[6],
                    NomProduit: NomProduit[7],
                    text: Rond_beton_Nervure_,
                    titre: mytitre6,
                  ),
                  BottomBar(
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
