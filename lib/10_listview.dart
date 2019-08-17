import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[900],
        title: new Text("Daftar Tutorial"),
      ),
      body: new ListView(
        children: <Widget>[
          // new ListTile(
          //   leading: new Icon(Icons.speaker),
          //   title: new Text("Speaker"),
          // ),
          new ListTutorial(
            gambar:
                "data:image/png;base64,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",
            judul: "HTML",
          ),
          new ListTutorial(
            gambar:
                "data:image/png;base64,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",
            judul: "CSS",
          ),
          new ListTutorial(
            gambar:
                "data:image/png;base64,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",
            judul: "JavaScript",
          ),
        ],
      ),
    );
  }
}

class ListTutorial extends StatelessWidget {
  ListTutorial({this.gambar, this.judul});

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Image(
              image: new NetworkImage(gambar),
              width: 80.0,
            ),
            new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      judul,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Text(
                      "Ini adalah deskripsi tutorial",
                      style: new TextStyle(fontSize: 13.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // new Text(
            //   judul,
            //   style: new TextStyle(fontSize: 20.0),
            // )
          ],
        ),
      ),
    );
  }
}
