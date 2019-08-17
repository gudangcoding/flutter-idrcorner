import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "idrcorner Application",
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: new AppBar(
        backgroundColor: Colors.red[800],
        leading: new Icon(Icons.home),
        title: new Center(child: new Text("idr corner"),),
        actions: <Widget>[new Icon(Icons.search)],
      ),
    );
  }
}
