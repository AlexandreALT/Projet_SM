import 'package:flutter/material.dart';
import 'package:projet_sm/tools/menu.dart';

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
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "Paramètres",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: const Text(
                    'Mon compte',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    backgroundColor: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/logout');
                  },
                  child: const Text(
                    'Se déconnecter',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    backgroundColor: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Supprimer mon compte',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    backgroundColor: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: Container(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Retour',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          style: TextButton.styleFrom(
            fixedSize: const Size(300, 50),
            backgroundColor: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
