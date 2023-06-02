import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // opp='sdjh';
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Calculater'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.bottomRight,
            child: Text(
              output.toString(),
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            custumOutlineButton('9'),
            custumOutlineButton('8'),
            custumOutlineButton('7'),
            custumOutlineButton('='),
          ],
        ),
        Row(
          children: <Widget>[
            custumOutlineButton('6'),
            custumOutlineButton('5'),
            custumOutlineButton('4'),
            custumOutlineButton('+'),
          ],
        ),
        // SizedBox(
        //   height: 0,
        // ),
        Row(
          children: <Widget>[
            custumOutlineButton('3'),
            custumOutlineButton('2'),
            custumOutlineButton('1'),
            custumOutlineButton('-'),
          ],
        ),
        Row(
          children: <Widget>[
            custumOutlineButton('0'),
            custumOutlineButton('C'),
            custumOutlineButton('/'),
            custumOutlineButton('x'),
          ],
        )
      ]),
    );
  }

  Expanded custumOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
        // padding:EdgeInsets.all(25),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          // style: TextStyle(
          //   fontSize: 25,
          //   fontWeight: FontWeight.bold,
          //   fontStyle: FontStyle.italic,
          // ),
        ),
      ),
    );
  }

  double first = 0, second = 0;
  // String _output = '',
  //text = "";
  String opp = '';
  double output = 0;
  String _output = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      // _output = "";
      // text = "";
      first = 0;
      second = 0;

      _output = '';
      setState(() {
        output = 0;
      });
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = double.parse(_output);
      // opp = btnText;
      _output = "";

      setState(() {
        output = 0;
      });
      // _output = "";
      opp = btnText;

      // prdouble(opp);
    } else if (btnText == "=") {
      // second = double.parse(_output);
      // prdouble(second.toString());
      // prdouble(first.toString());
      second = double.parse(_output);
      // _output = (first + second).toString();
      // setState(() {
      //   output = double.parse(_output);
      // });

      if (opp == "+") {
        _output = (first + second).toString();
        setState(() {
          output = double.parse(_output);
        });
      }
      if (opp == "-") {
        _output = (first - second).toString();
        setState(() {
          output = double.parse(_output);
        });
      }

      if (opp == "x") {
        _output = (first * second).toString();
        setState(() {
          output = double.parse(_output);
        });
      }

      if (opp == "/") {
        _output = (first / second).toString();
        setState(() {
          output = double.parse(_output);
        });
      }
    } else {
      _output = _output + btnText;
      setState(() {
        output = (double.parse(_output));
      });
    }
  }
}
