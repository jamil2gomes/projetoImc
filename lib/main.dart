import 'package:flutter/material.dart';
import 'imc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  String _infoText = "Informe seus dados";
  double _peso;
  double _altura;

  void _calcular() {
    setState(() {
      IMC imc = IMC(_altura, _peso);
      _infoText = "IMC: " + imc.calcula();
      print(imc.toString());
    });
  }

  void _resetFields() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Calculadora de IMC"),
            centerTitle: true,
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _resetFields,
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(Icons.person_outline,
                        size: 120.0, color: Colors.green),
                    TextFormField(
                      controller: pesoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso (kg)",
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      validator: (input) =>
                          input.isEmpty ? 'Digite seu peso' : null,
                      onSaved: (value) {
                        _peso = double.parse(pesoController.text);
                      },
                    ),
                    TextFormField(
                      controller: alturaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura (cm)",
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      validator: (input) =>
                          input.isEmpty ? 'Digite sua altura' : null,
                      onSaved: (value) {
                        _altura = double.parse(alturaController.text) / 100;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Container(
                          height: 50,
                          child: RaisedButton(
                              child: Text(
                                "Calcular",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.green,
                              onPressed: _submit)),
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
              ))),
    );
  }

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      _calcular();
    }
  }
}
