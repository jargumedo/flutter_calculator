import "package:calculadora/widgets/CalcButton.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:math_expressions/math_expressions.dart";

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String history = "";
  String expression = "";
  void allClear(String text) {
    setState(() {
      history = "";
      expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      expression = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    setState(() {
      history = expression;
      expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void addNumber(String text) {
    setState(() {
      expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment(1.0, 1.0),
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Text(
                        history,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 245, 248, 248),
                        )),
                      ),
                    )),
                Container(
                  alignment: Alignment(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      expression,
                      style: GoogleFonts.rubik(
                          textStyle:
                              TextStyle(fontSize: 48, color: Colors.white)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                        callback: allClear,
                        text: "AC",
                        textSize: 20.0,
                        bgColor: 0xFF00BF45),
                    CalcButton(
                      callback: clear,
                      text: "C",
                      textSize: 20.0,
                      bgColor: 0xFFE3303A,
                    ),
                    CalcButton(callback: addNumber, text: "%", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "/", textSize: 20.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(callback: addNumber, text: "7", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "8", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "9", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "*", textSize: 20.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(callback: addNumber, text: "4", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "5", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "6", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "+", textSize: 20.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(callback: addNumber, text: "1", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "2", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "3", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "-", textSize: 20.0)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(callback: addNumber, text: ".", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "0", textSize: 20.0),
                    CalcButton(callback: addNumber, text: "00", textSize: 20.0),
                    CalcButton(callback: evaluate, text: "=", textSize: 20.0)
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
