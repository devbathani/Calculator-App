import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(myapp());

class myapp extends StatefulWidget {
  const myapp({Key key}) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {

   String output = '0';
   double num1= 0.0;
   double num2=0.0;
   String _output='0';
   String operand= '';

   operation(String btntxt){
      if(btntxt=='C'){
        _output='0';
        num1=0.0;
        num2=0.0;
        operand='';
      }

      else if (btntxt == '+' || btntxt == '-' || btntxt == 'x' || btntxt == '/'){
        num1 = double.parse(output);
        operand=btntxt;
        _output= "0";
      }
      else if (btntxt == '='){
        num2=double.parse(output);


        if(operand=='+'){
          _output= (num1+num2).toString();
        }
        if(operand=='-'){
          _output= (num1-num2).toString();
        }
        if(operand=='x'){
          _output= (num1*num2).toString();
        }
        if(operand=='+/'){
          _output= (num1/num2).toString();
        }

        num1=0.0;
        num2=0.0;
        operand='';
      }

      else{
        _output=_output+btntxt;
      }
      
      setState(() {
        output= double.parse(_output).toStringAsFixed(0);
      });
   }

  Widget button(String btntxt){
    return Expanded(
        child: RawMaterialButton(
          splashColor: Colors.red,
          shape: Border.all(color: Colors.blue),
          fillColor: Colors.white,
          padding: EdgeInsets.all(30.0),
          child: Text(
              "$btntxt",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          onPressed: (){
             operation(btntxt);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Calculator")),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 0),
                    child: Text("$output",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.red),),
                  ),
              ),
              Row(
                children: [
                  button("7"),
                  SizedBox(width: 3,),
                  button("8"),
                  SizedBox(width: 3,),
                  button("9"),
                  SizedBox(width: 3,),
                  button("/"),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  button("4"),
                  SizedBox(width: 3,),
                  button('5'),
                  SizedBox(width: 3,),
                  button('6'),
                  SizedBox(width: 3,),
                  button('x'),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  button('1'),
                  SizedBox(width: 3,),
                  button('2'),
                  SizedBox(width: 3,),
                  button('3'),
                  SizedBox(width: 3,),
                  button('-'),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  button('0'),
                  SizedBox(width: 3,),
                  button('C'),
                  SizedBox(width: 3,),
                  button('='),
                  SizedBox(width: 3,),
                  button('+'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
