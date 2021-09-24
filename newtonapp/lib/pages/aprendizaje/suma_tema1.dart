import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newtonapp/shared/icons.dart';

class SumaTema1 extends StatelessWidget {
  
  SumaTema1({Key? key}) : super(key: key);
  CarouselController buttonCarouselController = CarouselController();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
                    carrusel2(context),
                    botonPasar(context),
                    botonSuma(context),
        ],
      ),
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

  Widget carrusel2(context) {
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
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          
         // height: 900,
          aspectRatio: 4/5,      
          autoPlay: false,
          enableInfiniteScroll: false,
          viewportFraction: 1,
                  ),
   
    );
  }

   Widget botonPasar(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: const Color.fromRGBO( 7, 194, 184, 1),
          //color: Colors.deepPurple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () => buttonCarouselController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
            child: const Text(
            'Pasar',
            style: TextStyle(
              color: Colors.white,
              //color: Colors.purple.shade700,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonSuma(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () => buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear),

          child: const Icon(
            //Icons.arrow_forward_ios_rounded,
            MyIcons.right,
            color: Colors.white,
            size: 45,            
          ),
        ));
  }
}
