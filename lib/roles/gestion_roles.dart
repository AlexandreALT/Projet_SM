import 'package:flutter/material.dart';
import 'package:projet_sm/roles/role.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

class GestionRoles extends StatelessWidget {
  const GestionRoles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Gestion des Rôles", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 15),
            Role(name: 'Administrateur'),
            SizedBox(height: 10),
            Role(name: 'Directeur'),
            SizedBox(height: 10),
            Role(name: 'Directeur Adjoint'),
            SizedBox(height: 10),
            Role(name: 'Assistant de direction'),
            SizedBox(height: 10),
            Role(name: 'Magasinier'),
            SizedBox(height: 10),
            Role(name: 'Chauffeur'),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width-40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_role');
            },
            child: const Text(
              'Créer un rôle',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
