import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/choice_capture.dart';
import 'package:projet_sm/login.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text("Accueil"),
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Bienvenue, ... !"),
              Text("Il y a X chantiers en cours."),
              Text("Il y a X articles en magasin dont X sur chantier.")
            ]),
      ),
    );
  }
}
