// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, camel_case_types

import 'dart:html';

import 'package:flutter/material.dart';

class myRow extends StatelessWidget {
  const myRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "SIDER EL-HADJAR",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: screenSize.width / 20,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
