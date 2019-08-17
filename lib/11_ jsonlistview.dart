import 'package:flutter/material.dart';
// Tambahkan http: ^0.12.0 di pubspec.yaml
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    // https://jsonplaceholder.typicode.com/
    title: "List View",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dataJSON;

  Future<String> ambildata() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    this.ambildata();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List Data JSON"),
      ),
      body: new ListView.builder(
        itemCount: dataJSON == null ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          return new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Card(
                  child: new Container(
                padding: new EdgeInsets.all(20.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      dataJSON[i]['title'],
                      style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                    new Text(dataJSON[i]['body']),
                  ],
                ),
              )));
        },
      ),
    );
  }
}

// void main() {
//   runApp(new MaterialApp(
//     title: "List View",
//     home: new Home(data: new List<String>.generate(300, (i) => "Ini data ke $i"),),
//   ));
// }

// class Home extends StatelessWidget {

//   final List<String> data;
//   Home ({this.data});

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("List View"),
//       ),
//       body: new Container(
//         child: new ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index){
//             return new ListTile(
//               leading: new Icon(Icons.widgets),
//               title: new Text("${data[index]}"),
//             );
//           },
//         )
//       ),
//     );
//   }
// }
