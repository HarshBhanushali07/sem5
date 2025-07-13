//wap to use stack widget and show text upon an image
import 'package:flutter/material.dart';

class stackWidget extends StatelessWidget {
  const stackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Stack Widget Demo")),
        body: Column(
          children: [
            Center(
              child: Stack(

                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/bmw.jpg",
                    width: 400,
                    height: 450,
                  ), // Image
                  Text(
                    "BMW",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}