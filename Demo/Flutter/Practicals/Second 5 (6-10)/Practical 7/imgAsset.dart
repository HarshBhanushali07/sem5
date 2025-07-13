//wap to display an image into the image asset widget from the asset folder
import 'package:flutter/material.dart';
class imgasset extends StatelessWidget {
  const imgasset({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Assets Practical"),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            children: [
                Image.asset("assets/car.jpeg")
            ],
          ),
        ),
      ),
    );
  }
}
