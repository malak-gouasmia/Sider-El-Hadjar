// ignore_for_file: avoid_web_libraries_in_flutter, camel_case_types, non_constant_identifier_names

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../OnHover.dart';

class ENTETE extends StatelessWidget {
  const ENTETE({
    Key? key,
    required double opacity,
    required this.screenSize,
  })  : _opacity = opacity,
        super(key: key);

  final double _opacity;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0).withOpacity(_opacity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              'assets/images/homePage/logo.png',
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            width: screenSize.width / 15,
          ),
          Container(
            child: Text(
              "SIDER EL HADJAR"
              "\nComplexe siderurgique  d'el-hadjar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 3,
              ),
            ),
          ),
          SizedBox(
              width: screenSize.width < 1000
                  ? screenSize.width * 0.1
                  : screenSize.width * 0.3),
          socialMedia(
            data: 'Facebook',
            mycolor: Colors.blue,
            lien: 'https://www.facebook.com/Sider-El-Hadjar-313175075760278/',
            myIcon: Icon(Icons.facebook),
          ),
          SizedBox(width: screenSize.width * 0.0001),
          socialMedia(
            data: 'Youtube',
            mycolor: Colors.red,
            lien: 'https://www.youtube.com/channel/UCHMlqty_Bo6Cil3_c1Gc0CQ',
            myIcon: Icon(FontAwesomeIcons.youtube),
          ),
          SizedBox(width: screenSize.width * 0.0001),
          socialMedia(
            data: 'Twitter',
            mycolor: Colors.blueAccent,
            lien: 'https://twitter.com/siderelhadjar',
            myIcon: Icon(FontAwesomeIcons.twitter),
          ),
        ],
      ),
    );
  }
}

class socialMedia extends StatelessWidget {
  const socialMedia({
    required this.data,
    required this.mycolor,
    required this.lien,
    required this.myIcon,
    Key? key,
  }) : super(key: key);
  final String data;
  final Color mycolor;
  final String lien;
  final Icon myIcon;
  @override
  Widget build(BuildContext context) {
    return OnHover(builder: (isHovered) {
      final data = isHovered ? this.data : '';
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OnHover(builder: (isHovered) {
              final Color = isHovered ? this.mycolor : Colors.white;
              final myIcon = this.myIcon;
              return IconButton(
                icon: myIcon,
                iconSize: 30,
                color: Color,
                onPressed: () {
                  html.window.open(this.lien, "_blank");
                },
              );
            }),
            Container(
              //color: Colors.amber,
              child: Text(
                data,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ]);
    });
  }
}
