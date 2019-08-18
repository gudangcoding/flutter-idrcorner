import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(new MaterialApp(home: new Login()));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  String nama = "";
  String gambar = "";

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
    );

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

    setState(() {
      nama = user.displayName;
      gambar = user.photoUrl;
    });

    _alertDialog();

    print("Nama User : ${user.displayName}");
    return user;
  }

  void _alertDialog() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text(
              "Sudah Login",
              style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            new Divider(),
            new ClipOval(child: new Image.network(gambar)),
            new Text("Anda Login Sebagai $nama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
            )
          ],
        ),
      ),
    );

    showDialog(context: context, child: alertDialog);
  }

  void _signOut(){
    googleSignIn.signOut();
    print("Sudah Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Google Login | Firebase"),
        backgroundColor: Colors.red[700],
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                onPressed: () => _signIn(),
                color: Colors.red[700],
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.developer_board),
                    new Text(
                      "Google Login",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              new RaisedButton(
                onPressed: () =>
                    _signOut(),
                color: Colors.green[700],
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.cancel),
                    new Text(
                      "Sign Out",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
