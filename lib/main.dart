import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Flutter Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    if (buttonText == "1"){
      num2 = double.parse(output);}
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
    else if(buttonText == "CLEAR")  {
      // ignore: unused_local_variable
      String _output = "0";
      // ignore: unused_local_variable
      double num1 = 0.0;
      // ignore: unused_local_variable
      double num2 = 0.0;
      // ignore: unused_local_variable
      String operand = "";
   }
   else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*"){
     num1 = double.parse(output);
     operand = buttonText;
     _output = "0";
   }
   else if(buttonText == "."){
     if(_output.contains(".")){
       print("Already contains a Decimal");
       return;
     }
     else{
       _output = _output + buttonText;
     }
    }
    else if (buttonText == "=") {
        num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else{
      _output = _output + buttonText;
    }

    print(_output);
    setState(() {
      _output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText){
   return new Expanded(

      child: new OutlineButton(
        color: Colors.white,
        splashColor: Colors.green,
        child: new Text(buttonText,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        padding: EdgeInsets.all(24.0),
        onPressed: () =>
          buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
        
        child: new Column(children: <Widget>[

          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 12.0
        ),

              child: new Text(output,
              style: new TextStyle(
                fontSize: 48.0,
                fontStyle: FontStyle.normal
              ),)
          ),

          new Expanded(
              child: new Divider()
          ),
          Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("/"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("-"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("."),
                  buildButton("+"),
                ],
              ),              new Row(
                children: <Widget>[
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          )
        ],),
        
      )
    );
  }
}
