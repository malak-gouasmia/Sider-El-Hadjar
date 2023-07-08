//import 'dart:html';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';
import '../widgets/OnHover.dart';

class Actualites extends StatefulWidget {
  @override
  _ActualitesState createState() => _ActualitesState();
}

class _ActualitesState extends State<Actualites> {
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

    final List<String> image = [
      'assets/images/news/news_1.jpg',
      'assets/images/news/news_2.jpg',
      'assets/images/news/news_3.jpg',
    ];
    final List<String> titre = [
      " \n les Scouts Islamiques de Ghardaia  ",
      " \n Annaba : Journées de la qualité et de la promotion du produit national ",
      " \n Commémoration de l'indépendance algérienne ",
    ];

    final List<String> para = [
      " \n Le groupe ' El-salam ' des c a effectué une visite exploratoire au complexe sidérurgique de Sider El hadjar , notamment certaines unités comme l'unité de lutte contre les incendies et l'unité de l'atelier de mécanique maghrébine.Où les visiteurs ont été présentés au siège de la caserne de la protection civile, un exercice de simulation par les éléments de l'unité, puis le groupe de scouts s'est déplacé à l'unité des ateliers mécaniques du Maghreb, où il leur a donné une explication détaillée de son activité et des étapes de production.Après le déjeuner organisé en leur honneur, les visiteurs ont effectué une visite exploratoire de l'usine en bus, au cours de laquelle ils ont vu le haut fourneau et quelques autres unités",
      " \n Sider El-Hadjar  a participé les 24 et 25 juillet 2022, à une réunion au siège de la salle de commerce et d'industrie seybousse Annaba, sous le slogan 'Journées de la qualité et de la promotion nationale des produits.La réunion a réuni plusieurs institutions nationales, praticiens de l'économie, de l'administration et des universitaires (chercheurs et étudiants), où ils ont abordé le thème de la mise à niveau et de la qualité des produits nationaux, de la numérisation verticale et de l' Exportations enragées à l'extérieur . ",
      " \n Aux côtés des institutions économiques et de diverses organisations et instances gouvernementales (scouts, sécurité nationale, gendarmerie nationale, protection civile, douanes) de l'Etat d'Annaba, Sider El-hadjar a participé à la célébration commémorative du 60 ème anniversaire de l'Indépendance algérienne  05 juillet 1962-2022.Où un cortège a été organisé pour divers véhicules  , où le gouverneur d'Annaba et les autorités civiles et militaires locales ont salué le cortège et tous les participants.Sider El-Hajjar a dédié à cette occasion, un cortège composé de deux semi-remorques chargées de nos divers produits longs et plats, de tuyaux sans soudure, de deux ambulances et de véhicules de pompiers avec un groupe d'ouvriers en vêtements de fer et d'acier.Vive l'Algérie libre et indépendante, gloire et éternité à nos pour nos  martyrs.",
    ];

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
                            image: AssetImage(
                              'assets/images/news/1.JPG',
                            ),
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
                                'Actualité de Sider El-Hadjar',
                                style: TextStyle(
                                  letterSpacing: 4,
                                  fontFamily: 'Electrolize',
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? screenSize.width / 20
                                          : screenSize.width / 35,
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
                  Container(
                    //color: Colors.blueGrey.shade100,
                    color: Color.fromARGB(255, 25, 33, 37).withOpacity(0.01),
                    // Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width / 20,
                        vertical: screenSize.width / 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Les dernières actualités',
                            style: TextStyle(
                              letterSpacing: 4,
                              fontFamily: 'Electrolize',
                              // fontFamily: 'Montserrat',
                              fontSize: screenSize.width < 800
                                  ? screenSize.width / 20
                                  : screenSize.width / 30,
                              color: Color.fromARGB(255, 248, 0, 0),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(-1.2, -1.2),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  blurRadius: 2,
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
                                Color.fromARGB(255, 255, 0, 0).withOpacity(1),
                            height: screenSize.width * 0.002,
                            width: screenSize.width,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          UneInfo(
                            myImage1: image[0],
                            screenSize: screenSize,
                            myText1: titre[0],
                            myText2: para[0],
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 255, 0, 0).withOpacity(1),
                            height: screenSize.width * 0.001,
                            width: screenSize.width * 0.5,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          UneInfo(
                            myImage1: image[1],
                            screenSize: screenSize,
                            myText1: titre[1],
                            myText2: para[1],
                          ),
                          SizedBox(
                            height: screenSize.width * 0.03,
                            width: screenSize.width,
                          ),
                          Container(
                            color:
                                Color.fromARGB(255, 255, 0, 0).withOpacity(1),
                            height: screenSize.width * 0.001,
                            width: screenSize.width * 0.5,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.05,
                            width: screenSize.width,
                          ),
                          UneInfo(
                            myImage1: image[2],
                            screenSize: screenSize,
                            myText1: titre[2],
                            myText2: para[2],
                          ),
                        ],
                      ),
                    ),
                  ),
                  /****************************** */
                  BottomBar(
                    screenSize: screenSize,
                    // screenSize: screenSize,
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

class UneInfo extends StatelessWidget {
  const UneInfo({
    Key? key,
    required this.myImage1,
    required this.screenSize,
    required this.myText1,
    required this.myText2,
  }) : super(key: key);

  final String myImage1;

  final Size screenSize;
  final String myText1;
  final String myText2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(myImage1), fit: BoxFit.cover)),
        child: Container(
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                SizedBox(
                  width: screenSize.width * 0.45,
                  height: screenSize.width * 0.28,
                ),
                OnHover(builder: (isHovered) {
                  final mycolor = isHovered
                      ? Colors.black.withOpacity(0.7)
                      : Colors.black.withOpacity(0.4);
                  return Container(
                    color: mycolor,
                    // color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                    width: screenSize.width * 0.45,
                    // height: screenSize.width * 0.05,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.width * 0.01,
                          horizontal: screenSize.width * 0.01),
                      child: Text(
                        myText1,
                        style: TextStyle(
                          //fontFamily: 'Electrolize',

                          //wordSpacing: 2,
                          fontSize: screenSize.width < 800
                              ? screenSize.width / 30
                              : screenSize.width / 65,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),

        //},
      ),
      Texteinfo(screenSize: screenSize, myText2: myText2)
      //Texteinfo(screenSize: screenSize,parag:myText),
    ]);
  }
}

class Texteinfo extends StatelessWidget {
  const Texteinfo({
    Key? key,
    required this.screenSize,
    required this.myText2,
  }) : super(key: key);

  final Size screenSize;
  final String myText2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.45,
      child: Text(
        myText2,
        style: TextStyle(
          fontFamily: 'Electrolize',
          wordSpacing: 2,
          fontSize: screenSize.width < 800
              ? screenSize.width / 30
              : screenSize.width / 65,
          color: Color.fromARGB(223, 0, 0, 0),
          fontWeight: FontWeight.w300,
        ),
        textAlign:
            screenSize.width < 800 ? TextAlign.justify : TextAlign.justify,
      ),
    );
  }
}
