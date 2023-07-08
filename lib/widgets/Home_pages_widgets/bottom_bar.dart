// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:awesome_icons/awesome_icons.dart';

import 'package:flutter_web/widgets/Home_pages_widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../OnHover.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;
  static const Color gradientStartColor = Color.fromARGB(229, 36, 34, 34);
  static const Color gradientEndColor = Color.fromARGB(174, 0, 2, 3);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: gradientStartColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: gradientEndColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
        ],
        gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'assets/images/homePage/footer.JPG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "\nSider El-Hadjar\nComplexe siderurgiqueD'El-Hadajar\n",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20,
                        fontFamily: 'Electrolize',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.phoneAlt),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Text(
                          '+213 (0) 38 98 20 10',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Container(
                          width: screenSize.width * 0.7,
                          child: Text(
                            "Complexe Sidérurgique d'El-Hadjar, BP 2055 , Sidi Amar , Annaba ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.mail),
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Text(
                          'Sider.elhadjar@alsolob-dz.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    /* BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),

                    // crossAxisAlignment: CrossAxisAlignment.start,

                    InfoText(
                      type: 'Email',
                      text: 'dylan@gmail.com',
                    ),
                    SizedBox(height: 5),
                    InfoText(
                      type: 'Address',
                      text: '128, Trymore Road, Delft, MN - 56124',
                    ),*/
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      SizedBox(
                        height: 150,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/homePage/footer.JPG',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "\nSider El-Hadjar\nComplexe siderurgiqueD'El-Hadajar",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                          fontFamily: 'Electrolize',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ]),

                    /******************************** */
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(FontAwesomeIcons.phoneAlt),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            Text(
                              '+213 (0) 38 98 20 10',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            Container(
                              width: screenSize.width * 0.4,
                              child: Text(
                                "Complexe Sidérurgique d ' El Hadjar , BP 2055 , Sidi Amar , Annaba ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 125, 9, 9),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.mail),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            Text(
                              'Sider.elhadjar@alsolob-dz.com',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  html.window
                      .open('https://twitter.com/siderelhadjar', "_blank");
                },
              );
            }),
          ]),
          SizedBox(height: 10),
          Text(
            '2022 | SIDER EL HADJAR .Tous droits réservés',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
