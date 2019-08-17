import 'package:flutter/material.dart';

class Radio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("RADIO", style: new TextStyle(fontSize: 30.0,),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Radio.svg/1024px-Radio.svg.png"), width: 200.0,)
          ],
        ),
      ),
    );
  }
}