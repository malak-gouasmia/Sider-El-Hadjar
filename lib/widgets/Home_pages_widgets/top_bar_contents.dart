import 'package:flutter/material.dart';
import 'package:flutter_web/screens/Aclualite.dart';
import 'package:flutter_web/screens/Contact.dart';
import 'package:flutter_web/screens/GammeDeProduits.dart';
import 'package:flutter_web/screens/Historique.dart';
import 'package:flutter_web/screens/PolitiqueQualite.dart';
import 'package:flutter_web/screens/QuiSommeNous.dart';
import 'package:flutter_web/screens/Recrutement.dart';

import '../../screens/home_page.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
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
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 50),
      child: Container(
        color: Color.fromARGB(255, 35, 34, 34).withOpacity(widget.opacity),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor:
                        Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
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
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Recrutement()));
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
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Actualites()));
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
                  SizedBox(width: screenSize.width / 15),
                  SizedBox(width: screenSize.width / 15),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
