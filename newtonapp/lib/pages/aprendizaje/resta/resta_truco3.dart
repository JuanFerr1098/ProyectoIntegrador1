import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newtonapp/shared/icons.dart';

class RestaTruco3 extends StatefulWidget {
  const RestaTruco3({Key? key}) : super(key: key);

  @override
  State<RestaTruco3> createState() => _RestaTruco3State();
}

class _RestaTruco3State extends State<RestaTruco3> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: myAppBar(context), // Organizar
      body: Column(
        children: <Widget>[
         // Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 8,
              child: Column(children: <Widget>[
                carrusel2(context),
              ])),
          Expanded(
              flex: 2,
              child: Column(children: <Widget>[
                botonSuma(context),
              ])),

        ],
      ),
    );
  }

  Widget carrusel2(context) {
    return CarouselSlider(
      items: <Widget>[
        SizedBox(
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/images%2Ftruco1-2.jpg?alt=media&token=15875dab-eba7-4f4c-aeb4-b1708a5ca2d0'),
          //child: Image(image: AssetImage('../assets/images/truco1-2.jpg'),),
          //child: Image.asset('/images/truco1-2.jpg', package: 'assets',),
          //fit: Boxfit.cover,
          width: 1080,
        ),
        SizedBox(
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/images%2Ftruco2.jpg?alt=media&token=7396cbf6-05b2-4d9a-9e3a-7acbc75947e3'),
          //child: Image.asset(listOfImage[1].assetName,
          //fit: BoxFit.cover,)
          //child: Image.asset('../assets/images/truco2.jpg'),
          width: 1080,
        ),
        SizedBox(
          //child: Image.network('gs://newtonapp-91e99.appspot.com/images/truco3.jpg'),
          //child: Image.asset('../assets/images/truco3.jpg'),
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/images%2Ftruco3.jpg?alt=media&token=f102b054-1b0c-4f77-9514-71cb0762b332'),
          width: 1080,
        ),
        SizedBox(
          //child: Image.asset('../assets/images/truco4.jpg'),
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/images%2Ftruco4.jpg?alt=media&token=5af27e6e-cc36-4d25-9ce9-938b8844fdae'),
          width: 1080,
          // color: Colors.yellow,
        ),
      ],
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        // height: 900,
        aspectRatio: 4 / 5,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
    );
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
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear),
          child: const Icon(
            //Icons.arrow_forward_ios_rounded,
            MyIcons.right,
            color: Colors.white,
            size: 45,
          ),
        ));
  }

  PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor:  const Color.fromRGBO( 0, 180, 216, 1),
      automaticallyImplyLeading: false,
      elevation: 0.0,
        title:  Text('Truco 3 Resta',
        style: TextStyle(
                fontFamily: 'QBold', 
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
              ),),
      actions: <Widget>[
        IconButton(
          //atras
          iconSize: 35.0,
          onPressed: ()  {
            Navigator.of(context).pop();
             /* Navigator.of(context).pushNamedAndRemoveUntil(
                'aprendizajeSuma', ModalRoute.withName('index'));*/
            /*await _authS.logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);*/
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ],
    );
  }
}
