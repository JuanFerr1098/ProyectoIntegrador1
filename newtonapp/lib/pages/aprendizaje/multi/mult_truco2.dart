import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newtonapp/shared/icons.dart';

class MultTruco2 extends StatefulWidget {
  const MultTruco2({Key? key}) : super(key: key);

  @override
  State<MultTruco2> createState() => _MultTruco2State();
}

class _MultTruco2State extends State<MultTruco2> {
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
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/mult%2Ftruco2%2FTruco2_MultP1.jpg?alt=media&token=347865a7-e401-4c1f-b43f-59a3d8352ba3'),
          //child: Image(image: AssetImage('../assets/images/truco1-2.jpg'),),
          //child: Image.asset('/images/truco1-2.jpg', package: 'assets',),
          //fit: Boxfit.cover,
          width: 1080,
        ),
        SizedBox(
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/mult%2Ftruco2%2FTruco2_MultP2.jpg?alt=media&token=d6c89bed-ab85-49f8-b569-804e93e49aa4'),
          //child: Image.asset(listOfImage[1].assetName,
          //fit: BoxFit.cover,)
          //child: Image.asset('../assets/images/truco2.jpg'),
          width: 1080,
        ),
        SizedBox(
          //child: Image.network('gs://newtonapp-91e99.appspot.com/images/truco3.jpg'),
          //child: Image.asset('../assets/images/truco3.jpg'),
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/mult%2Ftruco2%2FTruco2_MultP3.jpg?alt=media&token=e6df551c-0cdf-4afa-beea-257d103f16c3'),
          width: 1080,
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
        title:  const Text('Truco 2 Multiplicación',
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
