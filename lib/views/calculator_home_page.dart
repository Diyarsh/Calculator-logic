import 'package:flutter/material.dart';
import '../models/calculator_model.dart';
import '../controllers/calculator_controller.dart';

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final CalculatorModel model = CalculatorModel();
  late CalculatorController controller; // Use `late` keyword

  @override
  void initState() {
    super.initState();
    controller = CalculatorController(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator UI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Text(
                controller.display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                buildButtonRow(['7', '8', '9', '/']),
                buildButtonRow(['4', '5', '6', 'x']),
                buildButtonRow(['1', '2', '3', '-']),
                buildButtonRow(['0', '.', '=', '+']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (buttonText == '+' ||
                        buttonText == '-' ||
                        buttonText == 'x' ||
                        buttonText == '/') {
                      controller.operatorClick(buttonText);
                    } else if (buttonText == '=') {
                      controller.calculate();
                    } else {
                      controller.numClick(buttonText);
                    }
                  });
                },
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


