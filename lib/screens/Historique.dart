//import 'dart:html';
//import 'dart:html' as html;
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';

import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/timeline.dart';

import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class Historique extends StatefulWidget {
  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 1;
  List<String> haut = [
    'Période coloniale',
    '1964, création de SNS',
    '1983, création de EN SIDER',
    '1995, création du Groupe SIDER',
    '1999, création de ALFASID',
    'ISPAT Annaba le 18.10.2001 ',
    'Décembre 2004 Mittal Steel Annaba',
    'Juin 2007, ArcelorMittal Annaba',
    'Octobre 2013, ArcelorMittal Algérie',
    'Août 2016, SIDER EL-HADJAR',
  ];
  List<String> myText = [
    ' Le projet de construction d’une usine sidérurgique à Annaba été inscrit en 1958 dans le plan de Constantine. Ce projet a vu la Création de la Société Bônoise de Sidérurgie (SBS) qui a été chargée de réaliser un haut fourneau et ses annexes.',
    'Après l’indépendance, l’état algérien a créé, le 03 Septembre 1964, la Société Nationale de Sidérurgie (SNS) qui a été chargée de la construction du complexe sidérurgique d’El-Hadjar. 1969, première coulée : le complexe est entré en production après son inauguration le 19 juin1969 par le Président de l’état Algérien Houari Boumédiene.',
    'La restructuration de l’industrie algérienne à donné naissance à l’Entreprise Nationale SIDER.',
    'cette évolution marque le passage de l’entreprise administrée à l’entreprise économique EPE/SPA.',
    ' Un plan de redressement Interne du Groupe Sider donne naissance à 25 entreprises industrielles autonomes dont ALFASID qui représenté le « cœur du métier » de la sidérurgie.',
    'Un contrat de partenariat entre SIDER et LNM donne naissance à ISPAT Annaba. LNM détient 70% du capital social et SIDER 30%. Cette nouvelle société regroupe les filiales de SIDER liées au métier de base de la sidérurgie qui sont : Alfasid. Almain, Gessit, Iman, Amm, Comersid, Alfatub, Cryosid, Coprosid et Fersid). Ispat Tébessa est crée à la même période. Elle est le résultat d’un partenariat entre LNM (70%) et FERPHOS (30%). Elle comprend les mines de fer d’Ouenza et de Boukhadra. ',
    'La société change de dénomination après la fusion de LNM holding et ISPAT International.',
    ' Résultat de la fusion entre Mittal Steel et Arcelor.',
    'La société change de dénomination après la signature d’un accord stratégique entre ArcelorMittal et Sider par lequel, la participation d’ArcelorMittal dans le capital de la société passe à 49% et celle de Sider à 51%.',
    'La société devient Algérienne à 100% suite à la signature de l’accord de transfert de la totalité des actions détenues auparavant par le groupe ArcelorMittal vers le groupe public IMETAL.',
  ];

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
                            // image: AssetImage('assets/images/QT.JPG'),
                            image: AssetImage('assets/images/historique/1.JPG'),
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.6),
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
                                'Notre Historique',
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
                          /****************************** */
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '\n TimeLine \n',
                      style: TextStyle(
                          letterSpacing: 4,
                          fontFamily: 'Electrolize',
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? screenSize.width / 15
                              : screenSize.width / 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      color: Color.fromARGB(255, 159, 40, 40),
                      height: screenSize.width < 800
                          ? screenSize.width * 4
                          : screenSize.width * 2.5,
                      width: screenSize.width,
                      child: ProcessTimelinePage()),
                  BottomBar(screenSize: screenSize),
                ],
              ),
            ),
          ]),
        ));
  }
}
