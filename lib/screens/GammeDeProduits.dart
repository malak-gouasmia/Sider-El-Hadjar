//import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_web/screens/produits/Bobines_laminees_chaud_brutes.dart';
import 'package:flutter_web/screens/produits/Bobines_laminees_chaud_toles.dart';
import 'package:flutter_web/screens/produits/Bobines_toles_Galvanisees.dart';
import 'package:flutter_web/screens/produits/Bobines_toles_skin_passees.dart';
import 'package:flutter_web/screens/produits/Feuillard_Galvanise.dart';
import 'package:flutter_web/screens/produits/Feuillard_Lamine_froid.dart';
import 'package:flutter_web/screens/produits/Rond_beton_Nervure.dart';
import 'package:flutter_web/screens/produits/Toles_Nervur%C3%A9es_TN40.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';
import '../widgets/OnHover.dart';

class GammeProduits extends StatefulWidget {
  @override
  _GammeState createState() => _GammeState();
}

class _GammeState extends State<GammeProduits> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 1;
  //******************* */
  final List<String> images = [
    'assets/images/produit/1.JPG',
    'assets/images/produit/2.JPG',
    'assets/images/produit/3.JPG',
    'assets/images/produit/4.JPG',
    'assets/images/produit/5.JPG',
    'assets/images/produit/6.jpg',
    'assets/images/produit/7.JPG',
  ];
  final List<String> textes = [
    'Bobines laminées à chaud brutes ou décapées et toles',
    'Bobines laminées à chaud et toles striées ou larmées',
    'Bobines et toles skin-passées',
    'Bobines et toles Galvanisées',
    'Toles Nervurées TN40',
    'Feuillard Galvanisé',
    'Feuillard Laminé à froid',
    'Rond à béton Nervuré soudable',
  ];
  final List<Widget> pages = [
    BOBINE_Chaud_Brutes(),
    BOBINE_Chaud_Toles(),
    BOBINE_Toles_skin(),
    BOBINE_Toles_Galvanisees(),
    Toles_Nervurees_TN40(),
    Feuillard_Galvanise(),
    Feuillard_Lamine_froid(),
    Rond_beton_Nervure(),
  ];

  //********************** */

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
    /* final List _isHoveringg = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];*/

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
                        ? screenSize.height * 0.08
                        : screenSize.height * 0.15,
                  ),
                  Container(
                    color: Color.fromARGB(255, 25, 33, 37).withOpacity(0.8),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenSize.width < 800
                              ? screenSize.height * 0.05
                              : screenSize.height * 0.08,
                          horizontal: 0,
                        ),
                        child: SLIDERPROUDUITS()),
                  ),
                  Container(
                    //color: Colors.blueGrey.shade100,
                    color: Color.fromARGB(255, 25, 33, 37).withOpacity(0.1),
                    // Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width / 20,
                        vertical: screenSize.width / 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Prouduits plats',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontFamily: 'Electrolize',
                              fontSize: screenSize.width < 800
                                  ? screenSize.width / 25
                                  : screenSize.width / 30,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(-2, -2),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.03,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                            height: screenSize.width * 0.007,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          RowProduits(
                              myImage1: images[0],
                              myWidget1: pages[0],
                              screenSize: screenSize,
                              myText1: textes[0],
                              myImage: images[1],
                              myWidget: pages[1],
                              myText: textes[1]),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                            height: screenSize.width * 0.007,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          RowProduits(
                              myImage1: images[2],
                              myWidget1: pages[2],
                              screenSize: screenSize,
                              myText1: textes[2],
                              myImage: images[3],
                              myWidget: pages[3],
                              myText: textes[3]),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                            height: screenSize.width * 0.007,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          RowProduits(
                              myImage1: images[4],
                              myWidget1: pages[4],
                              screenSize: screenSize,
                              myText1: textes[4],
                              myImage: images[5],
                              myWidget: pages[5],
                              myText: textes[5]),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                            height: screenSize.width * 0.007,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          UnProduits(
                              myImage1: images[6],
                              myWidget1: pages[6],
                              screenSize: screenSize,
                              myText1: textes[6])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.blueGrey.shade100,
                    color: Color.fromARGB(255, 25, 33, 37).withOpacity(0.05),
                    // Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width / 20,
                        vertical: screenSize.width / 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Prouduits longs',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontFamily: 'Electrolize',
                              fontSize: screenSize.width < 800
                                  ? screenSize.width / 25
                                  : screenSize.width / 30,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(-2, -2),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.03,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 25, 33, 37).withOpacity(1),
                            height: screenSize.width * 0.007,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          UnProduits(
                              myImage1: images[6],
                              myWidget1: pages[7],
                              screenSize: screenSize,
                              myText1: textes[7])
                        ],
                      ),
                    ),
                  ),

                  /************************************************* */

                  BottomBar(
                    screenSize: screenSize,
                    //  screenSize: screenSize,
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

class RowProduits extends StatelessWidget {
  const RowProduits({
    Key? key,
    required this.myImage1,
    required this.myWidget1,
    required this.screenSize,
    required this.myText1,
    required this.myImage,
    required this.myWidget,
    required this.myText,
  }) : super(key: key);

  final String myImage1;
  final Widget myWidget1;
  final Size screenSize;
  final String myText1;
  final String myImage;
  final Widget myWidget;
  final String myText;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      UnProduits(
          myImage1: myImage1,
          myWidget1: myWidget1,
          screenSize: screenSize,
          myText1: myText1),
      SizedBox(
        width: screenSize.width * 0.2,
        height: screenSize.width * 0.3,
      ),
      UnProduits(
          myImage1: myImage,
          myWidget1: myWidget,
          screenSize: screenSize,
          myText1: myText),
    ]);
  }
}

class SdProduit extends StatelessWidget {
  const SdProduit({
    Key? key,
    required this.myImage,
    required this.myWidget,
    required this.screenSize,
    required this.myText,
  }) : super(key: key);

  final String myImage;
  final Widget myWidget;
  final Size screenSize;
  final String myText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(myImage), fit: BoxFit.cover)),
      child: OnHover(
        builder: (isHovered) {
          final mycolor =
              isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent;
          return Container(
            /* width: screenSize.width * 0.3,
                height: screenSize.width * 0.3,*/
            color: mycolor,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => myWidget));
              },
              child: Column(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.2,
                  ),
                  Container(
                    color: Colors.blueGrey.withOpacity(0.55),
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.width * 0.009,
                          left: screenSize.width * 0.009),
                      child: Text(
                        myText,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-2, -2),
                              color: Colors.black,
                              blurRadius: 2,
                            ),
                          ],
                          fontSize: screenSize.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UnProduits extends StatelessWidget {
  const UnProduits({
    Key? key,
    required this.myImage1,
    required this.myWidget1,
    required this.screenSize,
    required this.myText1,
  }) : super(key: key);

  final String myImage1;
  final Widget myWidget1;
  final Size screenSize;
  final String myText1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(myImage1), fit: BoxFit.cover)),
      child: OnHover(
        builder: (isHovered) {
          final mycolor =
              isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent;
          return Container(
            color: mycolor,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myWidget1));
              },
              child: Column(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.2,
                  ),
                  Container(
                    color: Colors.blueGrey.withOpacity(0.55),
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.width * 0.009,
                          left: screenSize.width * 0.009),
                      child: Text(
                        myText1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-2, -2),
                              color: Colors.black,
                              blurRadius: 2,
                            ),
                          ],
                          fontSize: screenSize.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SLIDERPROUDUITS extends StatefulWidget {
  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<SLIDERPROUDUITS> {
  final String imagePath = 'assets/images/';
  final CarouselController _controller = CarouselController();
  //List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  //int _current = 0;

  final List<String> images = [
    'assets/images/produit/1.JPG',
    'assets/images/produit/2.JPG',
    'assets/images/produit/3.JPG',
    'assets/images/produit/4.JPG',
    'assets/images/produit/5.JPG',
    'assets/images/produit/6.jpg',
    'assets/images/produit/7.JPG',
  ];

  final List<String> places = [
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              width: screenSize.width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        /**images  */
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 14 / 5,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  // _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        /**titre sur l image */
        AspectRatio(
          aspectRatio: 14 / 5,
          child: Center(
            child: Container(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              child: Text(
                'Notre gamme de produits ',
                style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(-2, -2),
                        color: Colors.black,
                        blurRadius: 5.0,
                      ),
                    ],
                    letterSpacing: 4,
                    fontFamily: 'Electrolize',
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width / 23
                        : screenSize.width / 30,
                    color: Color.fromARGB(255, 252, 252, 252),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
