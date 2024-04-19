import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 25,
                  fontWeight: FontWeight.w900)),
          scaffoldBackgroundColor: Colors.black87,
        ),
        debugShowCheckedModeBanner: false,
        home: MyCalculator());
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstnum = "";
  String secondnum = "";
  String result = "";
  String operator = "";
  onpressed(int a) {
    if (operator.isEmpty) {
      //value pass //after operators should put
      setState(() {
        firstnum = firstnum + a.toString();
      });
    } else {
      setState(() {
        secondnum = secondnum + a.toString();
      });
    }
  }

  void clearInput(String value) {
    if (value == "AC") {
      firstnum = "";
      secondnum = "";
      result = "";
      operator = "";
    }
  }

  onOperatorSelected(String op) {
    //   //print(op);
    //   if (firstnum.isEmpty) return;
    //   {
    //     operator = op;
    //   }
    // }
    if (firstnum.isNotEmpty) {
      operator = op;
      return;
    }
  }

  void deleteLastNumber() {
    if (secondnum.isNotEmpty) {
      secondnum = secondnum.substring(0, secondnum.length - 1);
      setState(() {});
      return;
    }

    if (operator.isNotEmpty) {
      operator = "";
      setState(() {});
      return;
    }

    if (firstnum.isNotEmpty) {
      print(firstnum.length);
      firstnum = firstnum.substring(0, firstnum.length - 1);
      //print(firstnum);
      setState(() {});
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              flex: 4,
              child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.teal[300]!.withOpacity(0.4),
                    border: Border.all(width: 2, color: Colors.teal),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                        '$firstnum $operator $secondnum ${result.isEmpty ? '' : '='}$result',
                        softWrap: false,
                        style: koutput.copyWith(
                          color: Colors.black,
                        )),
                  ))),
          Expanded(
              child: Row(children: [
            TypingButton(
                onTap: () {
                  // print("C");
                  clearInput("AC");
                  setState(() {});
                },
                text: "AC",
                color: Colors.green[400]),
            TypingButton(
                onTap: () {
                  //print("Del");
                  deleteLastNumber();
                },
                text: "Del",
                color: Colors.red[900]),
            TypingButton(
                onTap: () {
                  onOperatorSelected("%");
                  secondnum = "";
                  setState(() {});
                  //print("%");
                },
                text: "%",
                color: Colors.red[600]),
            TypingButton(
                onTap: () {
                  //  print("/");
                  onOperatorSelected("/");
                  secondnum = "";
                  setState(() {});
                },
                text: "/",
                color: Colors.red[600]),
          ])),
          Expanded(
              child: Row(children: [
            TypingButton(
                onTap: () {
                  //  print("7");
                  onpressed(7);
                },
                text: "7",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  //print("8");
                  onpressed(8);
                },
                text: "8",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  //print("9");
                  onpressed(9);
                },
                text: "9",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  if (firstnum.isNotEmpty) {
                    // print("x");
                    onOperatorSelected("X");
                    secondnum = "";
                    setState(() {});
                  }
                },
                text: "X",
                color: Colors.red[600]),
          ])),
          Expanded(
              child: Row(children: [
            TypingButton(
                onTap: () {
                  //print("4");
                  onpressed(4);
                },
                text: "4",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  // print("5");
                  onpressed(5);
                },
                text: "5",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  //  print("6");
                  onpressed(6);
                },
                text: "6",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  onOperatorSelected("+");
                  secondnum = "";
                  setState(() {});
                }
                //print("+");
                ,
                text: "+",
                color: Colors.red[600]),
          ])),
          Expanded(
              child: Row(children: [
            TypingButton(
                onTap: () {
                  onpressed(1);
                  //  print("1");
                },
                text: "1",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  // print("2");
                  onpressed(2);
                },
                text: "2",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  //   print("3");
                  onpressed(3);
                },
                text: "3",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  onOperatorSelected("-");
                  secondnum = "";
                  setState(() {});
                },
                text: "-",
                color: Colors.red[600]),
          ])),
          Expanded(
              child: Row(children: [
            TypingButton(
                onTap: () {
                  // print("0");
                  onpressed(0);
                },
                text: "0",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  // print(".");
                },
                text: ".",
                color: Colors.teal),
            TypingButton(
                onTap: () {
                  //if we used + directly that it is string so convert it into int
                  if (operator == "+") {
                    setState(() {
                      result = (int.parse(firstnum) + int.parse(secondnum))
                          .toString();
                    });
                  } else if (operator == "-") {
                    setState(() {
                      result = (int.parse(firstnum) - int.parse(secondnum))
                          .toString();
                    });
                  } else if (operator == "X") {
                    setState(() {
                      result = (int.parse(firstnum) * int.parse(secondnum))
                          .toString();
                    });
                  } else if (operator == "/") {
                    setState(() {
                      result = (int.parse(firstnum) / int.parse(secondnum))
                          .toString();
                    });
                  } else if (operator == "%") {
                    setState(() {
                      result = (int.parse(firstnum) % int.parse(secondnum))
                          .toString();
                    });
                  }
                  //print("=");
                },
                text: "=",
                color: Colors.teal[900]),
          ]))
        ],
      )),
    );
  }
}

class TypingButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function() onTap;
  TypingButton({required this.text, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(text,
                style: koutput.copyWith(fontSize: 20, color: Colors.black)),
          )),
    ));
  }
}
