// wap to design simple calculator ui using column, textfield , elevated button ,and row  using widget function
import 'package:flutter/material.dart';

class Calculatorui extends StatelessWidget {
  const Calculatorui({super.key});

  // Function to create a button widget for reusability
  Widget buildButton(String buttonText) {
    return Expanded( // Ensures buttons take up equal space in a row
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed:(){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(808080),
            padding: EdgeInsets.all(20.0), // Adjust padding for button size
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Column( // Main layout is a Column
          children: <Widget>[
            // TextField for displaying input/output
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '0', // Placeholder text
                ),
                style: TextStyle(fontSize: 24.0),
                readOnly: true, // Make TextField read-only if it's just for display
              ),
            ),
            // Rows of buttons
            Expanded( // Allows the button section to take remaining vertical space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('/'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('*'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('-'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      buildButton('C'), // Clear button
                      buildButton('0'),
                      buildButton('='), // Equals button
                      buildButton('+'),
                    ],
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

