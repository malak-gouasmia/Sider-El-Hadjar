//import 'dart:html';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/EnTete.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/Myrow.dart';

import 'package:flutter_web/widgets/Home_pages_widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/Home_pages_widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/Home_pages_widgets/responsive.dart';
import '../widgets/Home_pages_widgets/top_bar_contents.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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

    final formKey = GlobalKey<FormState>(); //key for form
    String nom = "";
    String? prenom = '';
    String email = '';
    String num = '';
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> titreTelephon = [
      "Direction Générale",
      "Approvisionnements",
      "Marketing",
      "Communication",
    ];
    List<String> textTelephon = [
      "Tél : +213 (0) 38 98 20 10",
      "Tél : +213 (0) 38 98 20 41",
      "Tél : +213 (0) 38 98 20 50",
      "Tél : +213 (0) 38 98 20 23",
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
                  /* SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0
                        : screenSize.height * 0.1,
                  ),*/
                  SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0
                        : screenSize.width * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/contacts/1.JPG'),
                            //'assets/images/produit/R.png'
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.7),
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
                                'Contacts',
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                      vertical: screenSize.width * 0.1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.shade300,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                          vertical: screenSize.width * 0.1,
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: ,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                                      iconSize: 25,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    Text(
                                      'Complex Sidérurgique',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\n  BP 2055 SIDI AMAR 23220\n\n  Annaba\n\n  Algeria',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                ...Iterable<int>.generate(titreTelephon.length)
                                    .map(
                                  (int pageIndex) => Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " " + titreTelephon[pageIndex],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              // fontFamily: 'Electrolize',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.phone),
                                                iconSize: 25,
                                                color: Colors.black,
                                                onPressed: () {},
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: screenSize.width * 0.01,
                                                ),
                                                child: Text(
                                                  textTelephon[pageIndex] +
                                                      "\n",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    // fontFamily: 'Electrolize',
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      screenSize.width * 0.01),
                                            ],
                                          ),
                                        ],
                                      ),
                                      //  SizedBox(width: screenSize.width / 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\nPoste de garde Sidi Amar (Bureau de réception et accueil)\n",
                                  /**************** */
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    // fontFamily: 'Electrolize',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.phone),
                                      iconSize: 25,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.width * 0.01,
                                      ),
                                      child: Text(
                                        "Tél        :  +213 (0) 38 98 20 20\nInterne :  50 41 25 - 50 35 72 ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          // fontFamily: 'Electrolize',
                                          fontWeight: FontWeight.w300,
                                        ),
                                        /***/
                                      ),
                                    ),
                                    SizedBox(height: screenSize.width * 0.01),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.mail),
                                      iconSize: 25,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.width * 0.01,
                                      ),
                                      child: Text(
                                        "Email : Securite.PGAccueil@ALSOLB-DZ.Com\n",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          // fontFamily: 'Electrolize',
                                          fontWeight: FontWeight.w300,
                                        ),
                                        /***/
                                      ),
                                    ),
                                    SizedBox(height: screenSize.width * 0.01),
                                  ],
                                ),
                              ],
                            ),
                            //  SizedBox(width: screenSize.width / 15),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /******************************************* */
                  Container(
                    color: Colors.black.withOpacity(0),
                    width: screenSize.width < 800
                        ? screenSize.width
                        : screenSize.width * 0.5,
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Form(
                      key: formKey, //key for form
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height * 0.04),
                          Text(
                            "Contactez‑nous",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF363f93)),
                          ),
                          Text(
                            "\nEcrire à : la communication du complexe sider el hadjar",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF363f93).withOpacity(0.5),
                            ),
                          ),
                          /******************nom****************** */
                          SizedBox(height: screenSize.height * 0.05),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nom",
                              hintText: "Entrer votre Nom ",
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre Nom';
                              }
                              if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return 'Le nom doit contenir seulement des caractères';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => setState(() => nom = value!),
                          ),
                          /****************************** */
                          SizedBox(height: screenSize.height * 0.05),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Prénom",
                              hintText: "Entrer votre Prénom ",
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre prénom';
                              }
                              if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return 'Le Prénom doit contenir seulement des caractères';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => setState(() => prenom = value!),
                          ),

                          /***************************number*************************************** */
                          SizedBox(height: screenSize.height * 0.05),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Numéro de téléphone",
                              hintText: "07 12 23 34 45 ",
                              icon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre Numéro de téléphone';
                              }
                              if (!RegExp(r'(^0+[567]+[0-9]+$)')
                                      .hasMatch(value) ||
                                  value.length != 10) {
                                return 'Votre numéro de téléphone est incorrect';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => setState(() => num = value!),
                          ),
                          /**********************mail**************************************** */
                          SizedBox(height: screenSize.height * 0.05),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "nom@exemple.com",
                              icon: Icon(Icons.mail),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre adresse-mail';
                              }
                              if (!RegExp(
                                      r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)')
                                  .hasMatch(value)) {
                                return 'Votre adress-mail est invalide';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => setState(() => email = value!),
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          TextFormField(
                            maxLength: 350,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: "Message",
                              hintText: "Ecrire un message ",
                              icon: Icon(Icons.keyboard),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Ecrire votre message ici ! ';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final message =
                                    'Mr/Mme $nom $prenom votre message a été envoyé avec succès ';
                                final snackBar = SnackBar(
                                  content: Text(
                                    message,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 49, 124, 51),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text(
                              "Envoyer",
                              style: TextStyle(
                                //fontFamily: 'Electrolize',
                                fontSize: screenSize.width < 800
                                    ? screenSize.width * 0.04
                                    : screenSize.width * 0.017,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.05),
                  /****************************** */
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
