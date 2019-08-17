import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Card & Parsing",
    home: new HalSatu(),
  ));
}

class HalSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card & Parsing"),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[            
            // NOTE  Supaya tidak mengulang data yang sama maka digunakan parsing
            // new Card(
            //   child:
            //     new Column(
            //       children: <Widget>[
            //         new Icon(Icons.home, size: 50.0, color: Colors.brown,),
            //         new Text("Home", style: new TextStyle(fontSize: 20.0),)
            //       ],
            //     )
            // ),
            // new Card(
            //   child:
            //     new Column(
            //       children: <Widget>[
            //         new Icon(Icons.home, size: 50.0, color: Colors.brown,),
            //         new Text("Home", style: new TextStyle(fontSize: 20.0),)
            //       ],
            //     )
            // ),

            new CardSaya(icon: Icons.home, teks: "Home", warnaIcon: Colors.brown,),
            new CardSaya(icon: Icons.favorite, teks: "Favorite", warnaIcon: Colors.pink,),
            new CardSaya(icon: Icons.place, teks: "Place", warnaIcon: Colors.blue,),
            new CardSaya(icon: Icons.settings, teks: "Setting", warnaIcon: Colors.black,),
          ],
        ),
      ),
    );
  }
}

// NOTE Parsing
class CardSaya extends StatelessWidget {

  // NOTE Supaya card berbeda-beda
  CardSaya({this.icon, this.teks, this.warnaIcon});
  final IconData icon;
  final String teks;
  final Color warnaIcon;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
          child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: warnaIcon,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 20.0),
          )
        ],
      )),
    );
  }
}
