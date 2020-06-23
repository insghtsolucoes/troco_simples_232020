import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TabbedAppBarSample());
}

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Troco Fácil',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 30.0,
                    fontStyle: FontStyle.normal)),
            centerTitle: true,
            backgroundColor: Colors.amber,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {},
              ) //Botao de refresh
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'TROCO', icon: Icons.attach_money),
  const Choice(title: 'RESUMO', icon: Icons.monetization_on),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              scrollPadding:
                  EdgeInsets.only(top: 40.0, right: 10.0, bottom: 10.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor a Pagar:",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 30.0,
                    fontStyle: FontStyle.normal),
              ),
            ), //Valor_Pago
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              scrollPadding:
                  EdgeInsets.only(top: 40.0, right: 10.0, bottom: 10.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor Recebido:",
                labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 30.0,
                    fontStyle: FontStyle.normal),
              ),
            ), //Valor_Recebid
            Container(
              padding: EdgeInsets.only(top: 10.0),
              height: 50.0,
              width: 390.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                color: Colors.amber,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
              child: Text(
                "Resultado",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
                //Texo do Resultado
              ),
            )
          ],
        ),
      ),
    ); //Tela de exibição abaixo da barra
  }
}
