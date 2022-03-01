import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newtonapp/shared/icons.dart';

class SumaTruco1 extends StatefulWidget {
  const SumaTruco1({Key? key}) : super(key: key);

  @override
  State<SumaTruco1> createState() => _SumaTruco1State();
}

class _SumaTruco1State extends State<SumaTruco1> {
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
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/sumas%2Ftruco1%2FTruco1_SumaP1.jpg?alt=media&token=ac433f84-33b9-489a-b715-716ebd4702ec'),
          //child: Image(image: AssetImage('../assets/images/truco1-2.jpg'),),
          //child: Image.asset('/images/truco1-2.jpg', package: 'assets',),
          //fit: Boxfit.cover,
          width: 1080,
        ),
        SizedBox(
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/sumas%2Ftruco1%2FTruco1_SumaP2.jpg?alt=media&token=746c5c38-f1fe-4bc7-96f1-15f699492e71'),
          //child: Image.asset(listOfImage[1].assetName,
          //fit: BoxFit.cover,)
          //child: Image.asset('../assets/images/truco2.jpg'),
          width: 1080,
        ),
        SizedBox(
          //child: Image.network('gs://newtonapp-91e99.appspot.com/images/truco3.jpg'),
          //child: Image.asset('../assets/images/truco3.jpg'),
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/sumas%2Ftruco1%2FTruco1_SumaP3.jpg?alt=media&token=20a3c38b-11e0-4a54-b6f6-f2fcfe2426b0'),
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
        title:  const Text('Truco 1 Suma',
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
