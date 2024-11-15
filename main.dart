import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    setState(() {
      double? num1 = double.tryParse(_num1Controller.text);
      double? num2 = double.tryParse(_num2Controller.text);

      if (_num1Controller.text.isEmpty || _num2Controller.text.isEmpty) {
        _result = 'Please enter both numbers';
        return;
      } else if (num1 == null || num2 == null) {
        _result = 'Please enter valid numbers';
        return;
      }

      switch (operation) {
        case '+':
          _result = (num1 + num2).toString();
          break;
        case '-':
          _result = (num1 - num2).toString();
          break;
        case '*':
          _result = (num1 * num2).toString();
          break;
        case '/':
          if (num2 == 0) {
            _result = 'Cannot divide by zero';
          } else {
            _result = (num1 / num2).toString();
          }
          break;
      }
    });
  }

  void _clear() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        centerTitle: true,  // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                controller: _num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter first number',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                controller: _num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter second number',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[200]),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[200]),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[200]),
                  child: Text(
                    '*',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[200]),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clear,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
