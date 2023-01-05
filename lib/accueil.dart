import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/choice_capture.dart';
import 'package:projet_sm/login.dart';
import 'package:projet_sm/settings.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/deconnexion.png'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return const Login();
                }));
              },
            );
          },
        ),
        title: const Text(
          "Accueil",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/role.png'),
            onPressed: () {Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
                  return const ChoiceCapture();
                }));},
          ),
          IconButton(
            icon: Image.asset('assets/parametre.png'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return const Settings();
                  }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          Container(
              child: Text("Bienvenue, ... !", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              alignment: Alignment.center),
          SizedBox(height: 50),
          Text("Il y a X chantiers en cours.",style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text("Il y a X articles en magasin",style: TextStyle(fontSize: 16)),
          Text("dont X sur chantier.",style: TextStyle(fontSize: 16)),
        ]),
      ),
    );
  }
}
