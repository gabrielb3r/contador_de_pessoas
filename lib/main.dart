import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText ="Pode entrar";
  void changePeople(int delta){
    setState((){
      _people += delta;
      if(_people<0){
        _infoText = "Mundo invertido";
      }else if(_people<=10 && _people>=0){
        _infoText = "pode entrar";
      }else{
        _infoText = "lotado";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("images/fundo.png", fit: BoxFit.cover, height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        changePeople(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.red),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.red),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic),
            )
          ],
        )
      ],
    );
  }
}
