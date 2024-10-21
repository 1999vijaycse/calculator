import 'package:flutter/material.dart';
import 'calculation.dart'; // Ensure this file contains the `calculateResult` function.

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  String _tempOutput = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _tempOutput = '';
      } else if (buttonText == '<-') {
        _output = _output.isNotEmpty ? _output.substring(0, _output.length - 1) : '';
      } else if (buttonText == '=') {
        _tempOutput = _calculateResult(_output);
      } else {
        _output += buttonText;
      }
    });
  }

  String _calculateResult(String expression) {
    return calculateResult(expression); // Use the function from calculation.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      backgroundColor: Colors.grey[300], // Set your desired background color here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            alignment: Alignment.centerRight,
            child: Text(
              _tempOutput,
              style: TextStyle(fontSize: 36, color: Colors.black54,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('*'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('C'),
                  _buildButton('0'),
                  _buildButton('<-'), // Delete button
                  _buildButton('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('='), // Calculate result
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => _buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
