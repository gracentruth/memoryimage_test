import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MemoryImageApp(),
    );
  }
}

class MemoryImageApp extends StatefulWidget {
  @override
  _MemoryImageExampleState createState() {
    return _MemoryImageExampleState();
  }
}

class _MemoryImageExampleState extends State {

  Uint8List imageData=Uint8List(100);

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  void loadAsset() async {
    Uint8List data = (await rootBundle.load('assets/eunjin.png'))
        .buffer
        .asUint8List();
    setState(() => this.imageData = data);
  }

  @override
  Widget build(BuildContext context) {
    print(MemoryImage(imageData, scale: 0.5));
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com - Flutter Tutorial'),
      ),
      body: Center(child: _ImageWrapper()),
    );
  }

  Widget _ImageWrapper() {
    if (imageData == null) {
      return CircularProgressIndicator();
    }

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover, image: MemoryImage(imageData, scale: 0.5)),
      ),
    );
  }
}