import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de carros", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _cars = 0;
  String _infoText = "Entrada permitida";
  int _maxQty = 12;

  void _changeMaxCarsQty(int delta) {
    setState(() {
      _maxQty += delta;

      if (_maxQty <= 0) {
        _maxQty = 0;
      }

    });
  }

  void _changeCarsQty(int delta) {
    setState(() {
      _cars += delta;

      if (_cars <= 0) {
        _cars = 0;
        _infoText = "Entrada permitida";
      } else if (_cars <= _maxQty) {
        _infoText = "Entrada permitida";
      } else if (_cars >= _maxQty) {
        _cars = _maxQty;
        _infoText = "Lotado";
      }  else {
        _infoText = "Lotado";
      }
    });
  }

  TextEditingController maxQty = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/nissan-350z-hd.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "A quantidade maxima atualmente e de $_maxQty carros",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      decoration: TextDecoration.none),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: FlatButton(
                        child: Text("+1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            )),
                        onPressed: () {
                          _changeMaxCarsQty(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: FlatButton(
                        child: Text("-1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            )),
                        onPressed: () {
                          _changeMaxCarsQty(-1);
                        },
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Carros: $_cars",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                    decoration: TextDecoration.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text("+1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          )),
                      onPressed: () {
                        _changeCarsQty(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text("-1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          )),
                      onPressed: () {
                        _changeCarsQty(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 24.0,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        )
      ],
    );
  }
}
