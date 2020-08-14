import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Calculator",
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget {
  @override
  _homegageState createState() => _homegageState();
}

class _homegageState extends State<homepage> {

  double sonuc;
  String number1='';
  String number2='';
  String islemtexti='';
  String islem;
  int sayac=0;

  String datatext="";
  String sonuctext="";

  void changetext(){
    setState(() {
      datatext=islemtexti;
    });
  }
  void result(){
    setState(() {
      sonuctext=sonuc.toString();
    });
  }
  void clear(){
    setState(() {
      datatext="";
      sonuctext="";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(

        child: Container(
          margin: EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(

                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text ("$datatext",

                    style:
                    const TextStyle(fontSize: 50.0),),
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text ("$sonuctext", style: const TextStyle(
                      color: Colors.green,
                      fontSize: 50.0),),
                ],
              ),
              Row(
                children: [
                  box("C", Colors.deepOrangeAccent,170),
                ],
              ),
              Row(
                children: [
                  box("7", Colors.greenAccent,5),
                  box("8", Colors.greenAccent,5),
                  box("9", Colors.greenAccent,5),
                  box("/", Colors.greenAccent,5),
                ],
              ),
              Row(
                children: [
                  box("4", Colors.greenAccent,5),
                  box("5", Colors.greenAccent,5),
                  box("6", Colors.greenAccent,5),
                  box("*", Colors.greenAccent,5),
                ],
              ),
              Row(
                children: [
                  box("1", Colors.greenAccent,5),
                  box("2", Colors.greenAccent,5),
                  box('3', Colors.greenAccent,5),
                  box("-", Colors.greenAccent,5),
                ],
              ),
              Row(

                children: [
                  box("0", Colors.greenAccent,3),
                  box("=", Colors.green, 84),
                  box("+", Colors.greenAccent, 3)
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget box(String click,Color color,double y){
    return MaterialButton(


      child: Text(click),
      onPressed: () {

        if(click=='C'){
          islemtexti="";
           clear();
        }
        else if(click=='='){
            calculate(islemtexti);
            result();
        }
        else{
          if(islemtexti.isNotEmpty){

          }
          islemtexti+=click;
             changetext();
        }
      },
      color: color,
      padding: EdgeInsets.symmetric(vertical: 25,horizontal:y),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),

    );
  }
  void calculate(String islemtexti) {
    double num1,num2;

    if(islemtexti.contains("+")){
      var a =islemtexti.split("+");
      sonuc=double.parse(a[0])+double.parse(a[1]);

    }
    else if(islemtexti.contains("-")){
      var a =islemtexti.split("-");
      sonuc=double.parse(a[0])-double.parse(a[1]);
    }
    else if(islemtexti.contains("/")){
      var a =islemtexti.split("/");
      sonuc=double.parse(a[0])/double.parse(a[1]);
    }
    else if(islemtexti.contains("*")){
      var a =islemtexti.split("*");
      sonuc=double.parse(a[0])*double.parse(a[1]);
    }

    print(sonuc.toString());

  }
}


