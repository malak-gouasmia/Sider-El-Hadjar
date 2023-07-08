//import 'dart:html';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class PolitiqueQualite extends StatefulWidget {
  @override
  _QualiteState createState() => _QualiteState();
}

class _QualiteState extends State<PolitiqueQualite> {
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
                                'assets/images/PolitiqueQualite/1.JPG'),
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
                                  : screenSize.width / 6,
                              left: ResponsiveWidget.isSmallScreen(context)
                                  ? screenSize.width / 40
                                  : screenSize.width / 20,
                            ),
                            child: Container(
                              color: Color.fromARGB(255, 255, 0, 0)
                                  .withOpacity(0.4),
                              child: Text(
                                'Notre politique qualité ',
                                style: TextStyle(
                                    letterSpacing: 4,
                                    fontFamily: 'Electrolize',
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? screenSize.width / 15
                                            : screenSize.width / 30,
                                    color: Color.fromARGB(255, 252, 252, 252),
                                    fontWeight: FontWeight.bold),
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
                            child: Container(
                              color: Color.fromARGB(255, 248, 246, 246)
                                  .withOpacity(0),
                              child: Text(
                                "La Qualité Est Notre Priorité",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontFamily: 'Electrolize',
                                  fontSize: screenSize.width < 800
                                      ? screenSize.width / 25
                                      : screenSize.width / 40,
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/PolitiqueQualite/2.JPG'),
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.3),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.1,
                            vertical: screenSize.width * 0.05),
                        child: Container(
                          color: Colors.white.withOpacity(0.7),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.1,
                                vertical: screenSize.width * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ' Satisfaire les exigences de nos clients au moindre coût tel est le défi qu’entend mener la Direction Générale de SIDER EL HADJAR au quotidien.\n'
                                  '\n Garantir la pérennité et la croissance de notre entreprise, et ainsi la prospérité et le Bien-être de toutes les parties intéressées par une bonne position concurrentielle sur les marchés acquis et d’en pénétrer de nouveaux, est notre objectif premier, qui ne peut être atteint sans le respect impératif des principes clefs suivants',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: screenSize.width < 800
                                        ? screenSize.width / 35
                                        : screenSize.width / 70,
                                  ),
                                  textAlign: screenSize.width < 800
                                      ? TextAlign.center
                                      : TextAlign.start,
                                ),
                                Text(
                                  '\n\n• Maîtriser et améliorer en continu la qualité de nos produits'
                                  '\n\n• Satisfaire aux exigences réglementaires, légales et normatives'
                                  '\n\n• Maitriser nos processus afin de livrer des produits conformes aux exigences de notre clientèle dans les délais convenus'
                                  '\n\n• Développer la compétence et l’implication du personnel'
                                  '\n\n• Souscrire aux logiques de la maîtrise et de l’amélioration continue des coûts'
                                  '\n\n• Etre à l’écoute de nos clients internes et externes, accroitre leur satisfaction et être respectueux de nos engagements afin de gagner leur confiance.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: screenSize.width < 800
                                        ? screenSize.width / 35
                                        : screenSize.width / 70,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(-1.5, -1.5),
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '\nJ’associe à cette politique des objectifs que je m’engage à définir de façon précise et formelle.'
                                  '\n\nJe m’engage en tant que Directeur Général, à allouer les ressources nécessaires pour mettre en œuvre cette politique et satisfaire aux exigences requises par la norme ISO 9001: 2008 du système de management de la qualité, ainsi qu’à l’amélioration continue de son efficacité.'
                                  '\n\nJe demande à l’équipe dirigeante ainsi qu’à l’ensemble du personnel de s’engager avec moi, par une implication effective et totale dans le cadre d’actions cohérentes, clairement définies et avec un esprit d’équipe, d’innovation et de créativité.'
                                  '\n\nCette politique sera communiquée, comprise au sein de l’entreprise et revue quant à son adéquation permanente.'
                                  '\n\nLa mobilisation et l’engagement de tous ceux qui travaillent avec nous et pour nous, sont les clés de la réussite de cette politique.',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: screenSize.width < 800
                                        ? screenSize.width / 35
                                        : screenSize.width / 70,
                                  ),
                                  textAlign: screenSize.width < 800
                                      ? TextAlign.center
                                      : TextAlign.start,
                                ),
                                Text(
                                  '\n\nDirection Générale - Politique Qualité ‘’Septembre ‘’ 2017’',
                                  style: TextStyle(
                                      fontFamily: 'Electrolize',
                                      fontSize: screenSize.width < 800
                                          ? screenSize.width / 35
                                          : screenSize.width / 75,
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ),
                        ),
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
      child: Container(
        color: Color.fromARGB(255, 255, 0, 0).withOpacity(0.4),
        child: Text(
          'Notre politique qualité ',
          style: TextStyle(
              letterSpacing: 4,
              fontFamily: 'Electrolize',
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width / 15
                  : screenSize.width / 30,
              color: Color.fromARGB(255, 252, 252, 252),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
