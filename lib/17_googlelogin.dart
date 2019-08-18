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

// NOTE Menggunakan https://firebase.google.com/
/* 
1. Mulai
2. Add Project
3. Isi nama project
4. Pilih Android App
5. Tulis com.company.appname contoh: com.mazharrasyad.logingoogle
6. Isi Sertifikat SHA-1 dengan buka link https://developers.google.com/android/guides/client-auth
7. Buka terminal dan jalankan perintah berikut

keytool -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore

Enter keystore password: android
...
SHA1: EF:F6:D0:62:DF:66:C4:6B:DE:5A:8F:32:5A:FF:E0:A4:B5:01:36:AE
...

Copy EF:F6:D0:62:DF:66:C4:6B:DE:5A:8F:32:5A:FF:E0:A4:B5:01:36:AE 
8. Isi dengan sertifikat dengan key diatas
9. Download google-services.json
10. Letakkan di project/android/app
11. Tambahkan classpath 'com.google.gms:google-services:4.2.0' pada file project/android/build.gradle di dalam dependencies
12. Tambahkan apply plugin: 'com.google.gms.google-services' pada file project/android/app/build.gradle di paling bawah
13. Cari code applicationId "com.example.a_flutter" dan sesuaikan dengan nama yang sebelumnya
14. Kemudian finish dan lewati jika ada pengetesan aplikasi
15. Akan kembali ke halaman Firebase dan pada menu bar kiri pilih Authentication
16. Klik Siapkan Metode Masuk yang ada di tengah layar
17. Klik Google dan pilih Aktifkan
18. Tambahkan kode berikut dibawah cupertino_icons: ^0.1.2 pada file pubspec.yaml
firebase_auth:
google_sign_in:
19. Import firebase dan google sign in pada main.dart
*/
