//import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;
const completeColor = Color(0xff5e6172);
const inProgressColor = Colors.red;
//const inProgressColor = Color(0xff5ec792);3
const todoColor = Color(0xffd1d2d7);
//var screenSize = MediaQuery.of(context).size;

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: TitleAppBar('Process Timeline'),
      body: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.vertical,
          connectorTheme: ConnectorThemeData(
            space: 40,

            //30.0,
            thickness: 5.0,
          ),
          indicatorTheme: IndicatorThemeData(),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) => screenSize.width < 850
              ? MediaQuery.of(context).size.width * 1.35
              : MediaQuery.of(context).size.width / 4,

          //ss/ _processes.length,
          oppositeContentsBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: index <= _processIndex
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      width: screenSize.width < 800
                          ? screenSize.width * 0.6
                          : screenSize.width * 0.35,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          // index <= _processIndex ? myText[index] : '',
                          myText[index],
                          style: TextStyle(
                            color: index == _processIndex
                                ? inProgressColor
                                : completeColor,
                            fontWeight: FontWeight.w400,
                            // wordSpacing: 1.5,
                            fontSize: screenSize.width < 800 ? 14 : 19,
                          ),
                          //  textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  : null,
              /* Image.asset(
                'assets/images/process_timeline/status${index + 1}.png',
                width: 50.0,
                color: getColor(index),
              ),*/
            );

            /********************* */
          },
          contentsBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getColor(index),
                        ),
                      ),
                      index == _processIndex
                          ? OutlinedButton(
                              // color: inProgressColor,
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.all(18),
                                backgroundColor: Colors.red,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  _processIndex =
                                      (_processIndex + 1) % _processes.length;
                                });
                              },
                              child: Icon(
                                index == _processes.length - 1
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                //Icons.arrow_upward,
                                //Icons.arrow_downward,
                                color: Colors.white,
                              ),
                              //Text('Suivant'),
                              // icon: Icon(FontAwesomeIcons.chevronDown), //child: null,
                              // backgroundColor: inProgressColor,
                            )
                          : Text('')
                    ]));
            // : Text('');
          },
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index == _processIndex) {
              color = inProgressColor;

              child = Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (index < _processIndex) {
              color = completeColor;
              child = Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
            }

            if (index <= _processIndex) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(30.0, 30.0),
                    painter: _BezierPainter(
                      color: color,
                      drawStart: index >= 0,
                      drawEnd: index < _processIndex,
                    ),
                  ),
                  DotIndicator(
                    size: 33.0,
                    color: color,
                    child: child,
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(15.0, 15.0),
                    painter: _BezierPainter(
                      color: color,
                      drawEnd: index < _processes.length - 1,
                    ),
                  ),
                  OutlinedDotIndicator(
                    borderWidth: 4.0,
                    color: color,
                  ),
                ],
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == _processIndex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)!
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: _processes.length,
        ),
      ),

      /* floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.chevronDown),
        onPressed: () {
          setState(() {
            _processIndex = (_processIndex + 1) % _processes.length;
          });
        },
        backgroundColor: inProgressColor,
      ),*/
    );
  }
}

/// hardcoded bezier painter
// ignore: todo
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
            0.0,
            size.height / 2,
            -radius,
            // ignore: todo
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
            size.width,
            size.height / 2,
            size.width + radius,
            // ignore: todo
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Période\ncoloniale',
  '1964',
  '1983',
  '1995',
  '1999',
  '2001',
  '2004',
  '2007',
  '2013',
  '2016',
];
List<String> myText = [
  ' Le projet de construction d’une usine sidérurgique à Annaba été inscrit en 1958 dans le plan de Constantine. Ce projet a vu la Création de la Société Bônoise de Sidérurgie (SBS) qui a été chargée de réaliser un haut fourneau et ses annexes.',
  'Après l’indépendance, l’état algérien a créé, le 03 Septembre 1964, la Société Nationale de Sidérurgie (SNS) qui a été chargée de la construction du complexe sidérurgique d’El-Hadjar. 1969, première coulée : le complexe est entré en production après son inauguration le 19 juin1969 par le Président de l’état Algérien Houari Boumédiene.',
  'La restructuration de l’industrie algérienne à donné naissance à l’Entreprise Nationale SIDER.',
  'cette évolution marque le passage de l’entreprise administrée à l’entreprise économique EPE/SPA.',
  ' Un plan de redressement Interne du Groupe Sider donne naissance à 25 entreprises industrielles autonomes dont ALFASID qui représenté le « cœur du métier » de la sidérurgie.',
  'Un contrat de partenariat entre SIDER et LNM donne naissance à ISPAT Annaba. LNM détient 70% du capital social et SIDER 30%. Cette nouvelle société regroupe les filiales de SIDER liées au métier de base de la sidérurgie qui sont : Alfasid. Almain, Gessit, Iman, Amm, Comersid, Alfatub, Cryosid, Coprosid et Fersid). Elle est le résultat d’un partenariat entre LNM (70%) et FERPHOS(30%). Elle comprend les mines de fer d’Ouenza et de Boukhadra. ',
  'La société change de dénomination après la fusion de LNM holding et ISPAT International.',
  ' Résultat de la fusion entre Mittal Steel et Arcelor.',
  'La société change de dénomination après la signature d’un accord stratégique entre ArcelorMittal et Sider par lequel, la participation d’ArcelorMittal dans le capital de la société passe à 49% et celle de Sider à 51%.',
  'La société devient Algérienne à 100% suite à la signature de l’accord de transfert de la totalité des actions détenues auparavant par le groupe ArcelorMittal vers le groupe public IMETAL.',
];
