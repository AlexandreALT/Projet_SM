import 'package:flutter/material.dart';
import 'package:projet_sm/logout.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {},
            );
          },
        ),
        title: const Text(
          "Paramètres",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Modifier le profil',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/logout');
                },
                child: const Text(
                  'Se déconnecter',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Supprimer mon compte',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
