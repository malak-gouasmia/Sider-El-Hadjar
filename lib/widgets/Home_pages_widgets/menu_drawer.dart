// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_web/screens/Aclualite.dart';
import 'package:flutter_web/screens/Contact.dart';
import 'package:flutter_web/screens/GammeDeProduits.dart';
import 'package:flutter_web/screens/Historique.dart';
import 'package:flutter_web/screens/PolitiqueQualite.dart';
import 'package:flutter_web/screens/QuiSommeNous.dart';
import 'package:flutter_web/screens/Recrutement.dart';
import 'package:flutter_web/widgets/OnHover.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;
import '../../screens/home_page.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  // Initial Selected Value
  String dropdownvalue = 'Home';

  // List of items in our dropdown menu
  var items = [
    'Home',
    'Historique',
    'Qui sommes-nous ?',
    'Nos produits',
    'Notre politique de qualité',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/homePage/logo.png',
                    width: 130,
                    height: 100,
                  ),
                  Text(
                    "SIDER\nEL-HADJAR",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      // fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              DropdownButton(
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Color.fromARGB(255, 21, 21, 21).withOpacity(1),
                iconEnabledColor: Color.fromARGB(255, 255, 255, 255),

                //elevation: 10,
                alignment: Alignment.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 249, 249, 249),

                    //fontWeight: FontWeight.w300,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newValue == items[2]
                            ? QuiSommesNous()
                            : newValue == items[3]
                                ? GammeProduits()
                                : newValue == items[4]
                                    ? PolitiqueQualite()
                                    : newValue == items[1]
                                        ? Historique()
                                        : HomePage(),
                      ));
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Recrutement()));
                },
                child: Text(
                  'Recrutement',
                  style: TextStyle(
                      color: _isHovering[1]
                          ? Color.fromARGB(255, 255, 1, 1)
                          : Color.fromARGB(255, 246, 244, 244),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Actualites()));
                },
                child: Text(
                  'Actualité & News',
                  style: TextStyle(
                      color: _isHovering[2]
                          ? Color.fromARGB(255, 255, 1, 1)
                          : Color.fromARGB(255, 245, 242, 242),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[6] = true : _isHovering[6] = false;
                  });
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contact()));
                },
                child: Text(
                  'Contacts',
                  style: TextStyle(
                      color: _isHovering[6]
                          ? Color.fromARGB(255, 255, 1, 1)
                          : Color.fromARGB(255, 246, 242, 242),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OnHover(builder: (isHovered) {
                              final double mySize = isHovered ? 35 : 30;
                              final Color mycolor = isHovered
                                  ? Colors.blue.withOpacity(1)
                                  : Colors.blue.withOpacity(0.8);

                              return IconButton(
                                icon: Icon(FontAwesomeIcons.facebookSquare),
                                iconSize: mySize,
                                color: mycolor,
                                onPressed: () {
                                  html.window.open(
                                      'https://www.facebook.com/Sider-El-Hadjar-313175075760278/',
                                      "_blank");
                                },
                              );
                            }),
                            OnHover(builder: (isHovered) {
                              final double mySize = isHovered ? 35 : 30;
                              final Color mycolor = isHovered
                                  ? Colors.red.withOpacity(1)
                                  : Colors.red.withOpacity(0.8);

                              return IconButton(
                                icon: Icon(FontAwesomeIcons.youtube),
                                iconSize: mySize,
                                color: mycolor,
                                onPressed: () {
                                  html.window.open(
                                      'https://www.youtube.com/channel/UCHMlqty_Bo6Cil3_c1Gc0CQ',
                                      "_blank");
                                },
                              );
                            }),
                            OnHover(builder: (isHovered) {
                              final double mySize = isHovered ? 35 : 30;
                              final Color mycolor = isHovered
                                  ? Colors.blueAccent.withOpacity(1)
                                  : Colors.blueAccent.withOpacity(0.8);

                              return IconButton(
                                icon: Icon(FontAwesomeIcons.twitter),
                                iconSize: mySize,
                                color: mycolor,
                                onPressed: () {
                                  html.window.open(
                                      'https://twitter.com/siderelhadjar',
                                      "_blank");
                                },
                              );
                            }),
                          ]),
                      Text(
                        'SIDER | 2022',
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
