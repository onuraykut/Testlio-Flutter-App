import 'package:eslesmeapp/data/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */
import 'package:flutter/material.dart';

import 'login.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  var username='Anonim';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   if(getUser().displayName!=null) {
    if(getUser().displayName.isNotEmpty)
      username = getUser().displayName;
   }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Ayarlar',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: getUser().photoURL !=null ? CircleAvatar(
                   backgroundImage: NetworkImage(getUser().photoURL),
                ) : null,
                title: Text( username  ,style: TextStyle(color: Colors.black),),
                onTap: () {},
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Çıkış"),
                onTap: () {
                  _showDialogLogout();
                },
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  User getUser() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User user = _auth.currentUser;
    return user;

  }

  Future signOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false,
    );
    debugPrint('Cikis yapildi');
    return Future.delayed(Duration.zero);
  }

  void _showDialogLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Çıkış yapmak istediğinizden emin misiniz?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
                //Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {
                signOut();
              },
            ),
          ],
        );
      },
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}
