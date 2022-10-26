import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int fnum = 0;
  int snum = 0;
  String display = "";
  String res = "";
  String operation = "";

  void btnclicked(String btntext) {
    if (btntext == "C") {
      display = "";
      fnum = 0;
      snum = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      fnum = int.parse(display);
      res = "";
      operation = btntext;
    } else if (btntext == "=") {
      snum = int.parse(display);
      if (operation == "+") {
        res = (fnum + snum).toString();
      }

      if (operation == "-") {
        res = (fnum - snum).toString();
      }

      if (operation == "x") {
        res = (fnum * snum).toString();
      }

      if (operation == "/") {
        res = (fnum ~/ snum).toString();
      }
    } else {
      res = int.parse(display + btntext).toString();
    }

    setState(() {
      display = res;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(25.0),
        ),
        onPressed: () => btnclicked(btnVal),
        child: Text(
          "$btnVal",
          style: TextStyle(
            fontSize: 25.00,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$display",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
