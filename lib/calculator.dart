import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var displayText = '0';
  var userInput = '';

  void handleButtons(String num) {
    setState(() {
      if (num == '=') {
        equalPressed();
      } else if (num == 'Reset') {
        userInput = '';
        displayText = '0';
      } else if (num == 'Delete') {
        userInput = userInput.substring(0, userInput.length - 1);
      } else {
        userInput += num;
      }
    });
  }

  void equalPressed() {
    String finalInput = userInput;
    finalInput = finalInput.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    displayText = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "My Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  userInput,
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  displayText,
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            calcButtons(
                num: '+',
                color: Colors.amber,
                onPressed: () => handleButtons('+')),
            calcButtons(
                num: '-',
                color: Colors.amber,
                onPressed: () => handleButtons('-')),
            calcButtons(
                num: '/',
                color: Colors.amber,
                onPressed: () => handleButtons('/')),
            calcButtons(
                num: 'X',
                color: Colors.amber,
                onPressed: () => handleButtons('x')),
            calcButtons(
                num: '=',
                color: Colors.amber,
                onPressed: () => handleButtons('=')),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            calcButtons(
                num: '0',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('0')),
            calcButtons(
                num: '1',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('1')),
            calcButtons(
                num: '2',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('2')),
            calcButtons(
                num: '3',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('3')),
            calcButtons(
                num: '4',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('4')),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            calcButtons(
                num: '5',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('5')),
            calcButtons(
                num: '6',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('6')),
            calcButtons(
                num: '7',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('7')),
            calcButtons(
                num: '8',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('8')),
            calcButtons(
                num: '9',
                color: Colors.lightBlue,
                onPressed: () => handleButtons('9')),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            calcButtons(
                num: 'Reset',
                color: Colors.orange,
                onPressed: () => handleButtons('Reset')),
            Padding(padding: EdgeInsets.all(10)),
            calcButtons(
                num: 'Delete',
                color: Colors.red,
                onPressed: () => handleButtons('Delete')),
          ],
        )
      ],
    ));
  }
}

class calcButtons extends StatelessWidget {
  String num;
  Color color;
  VoidCallback? onPressed;

  calcButtons(
      {super.key, required this.num, required this.color, this.onPressed});

  // const calcButtons({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        num,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
