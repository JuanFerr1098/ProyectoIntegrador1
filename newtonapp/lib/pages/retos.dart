import 'package:flutter/material.dart';

class Retos extends StatefulWidget {
  final String title = 'Rétate aqui';

  const Retos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Retos();
}

class _Retos extends State<Retos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text(widget.title),
      ),
    );
  }
}
