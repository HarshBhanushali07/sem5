//wap to design shopping item card using card, column,image, text and elevatedbutton
import 'package:flutter/material.dart';

class shoping_card extends StatelessWidget {
  const shoping_card({super.key});

  Widget shopingCard(String ulr, String name) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      borderOnForeground: true,
      color: Color(0xffdadaeb),
      elevation: 100,
      shadowColor: Color(0xff9b9bc2),

      child: Row(
        children: [
          Image.asset(ulr, width: 200, height: 200),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text(name),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('+')),
                    SizedBox(width: 20),
                    Text('1'),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () {}, child: Text('-')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Shopping Card", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              shopingCard("assets/canon.jpg", "CANON CAMERA"),
              shopingCard("assets/sony.jpg", "SONY CAMERA"),
              shopingCard("assets/camera.jpg", "CANON CAMERA"),
              shopingCard("assets/nikon.jpeg", "NIKON CAMERA"),
            ],
          ),
        ),
      ),
    );
  }
}
