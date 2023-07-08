import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainCarousel extends StatefulWidget {
  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  final String imagePath = 'assets/images/slider';
  final CarouselController _controller = CarouselController();
  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  //int _current = 0;

  final List<String> images = [
    /*'assets/images/(1).JPG',
    'assets/images/(152).JPG',
    'assets/images/(181).JPG',
    'assets/images/(172).JPG',
    'assets/images/(171).JPG',
    'assets/images/(119).JPG',*/

    'assets/images/slider/1.JPG',
    'assets/images/slider/2.JPG',
    'assets/images/slider/3.JPG',
    'assets/images/slider/4.JPG',
    'assets/images/slider/5.JPG',
    'assets/images/slider/6.JPG',
    'assets/images/slider/7.JPG',
  ];

  final List<String> places = [
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              width: screenSize.width * 0.74,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        /**images  */
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              //enlargeCenterPage: true,
              aspectRatio: 17 / 6,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  // _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        /**titre sur l image */
        AspectRatio(
          aspectRatio: 17 / 6,
          child: Center(
            child: AnimatedContainer(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.08,
                      vertical: screenSize.width * 0.05),
                  child: Text(
                    'Bienvenue',

                    // places[_current]

                    style: TextStyle(
                      letterSpacing: 4,
                      // fontFamily: 'Electrolize',
                      fontSize: screenSize.width / 25,
                      color: Color.fromARGB(255, 222, 222, 222),
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
            ),
          ),
        ),
        screenSize.width < 800
            ? Container(
                color: Colors.black,
              )
            : AspectRatio(
                aspectRatio: 17 / 6.5,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        color: Color.fromARGB(255, 35, 34, 34).withOpacity(1),
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 500,
                            bottom: screenSize.height / 500,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor:
                                          Color.fromARGB(0, 128, 119, 119),
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Colors.blueGrey[900]
                                                : Color.fromARGB(
                                                    238, 244, 240, 240),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
