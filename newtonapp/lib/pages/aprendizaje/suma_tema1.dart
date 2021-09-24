import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SumaTema1 extends StatelessWidget {
  const SumaTema1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          carrusel2()
        ],),
    );
  }

  Widget carrusel() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(
          child: Image.asset('../assets/images/truco1-2.jpg'),
          width: 500.0,
          //height: 250.0,
        ),
        SizedBox(
          child: Image.asset('../assets/images/truco2.jpg'),
          width: 500.0,
        ),
        SizedBox(
          child: Image.asset('../assets/images/truco3.jpg'),
          width: 500.0,
        ),
        SizedBox(
          child: Image.asset('../assets/images/truco4.jpg'),
          width: 500.0,
          // color: Colors.yellow,
        ),
      ],
    );
  }

  Widget carrusel2() {
    return CarouselSlider(
        items: <Widget>[
          SizedBox(
            child: Image.asset('../assets/images/truco1-2.jpg'),
            //fit: Boxfit.cover,
            width: 1080,
          ),
          SizedBox(
            child: Image.asset('../assets/images/truco2.jpg'),
            width: 1080,
          ),
          SizedBox(
            child: Image.asset('../assets/images/truco3.jpg'),
            width: 1080,
          ),
          SizedBox(
            child: Image.asset('../assets/images/truco4.jpg'),
            width: 1080,
            // color: Colors.yellow,
          ),
        ],
        options: CarouselOptions(
          autoPlay: false,

        ),
    );
  }
}
