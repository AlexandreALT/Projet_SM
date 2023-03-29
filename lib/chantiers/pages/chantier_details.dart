import 'package:flutter/material.dart';
import 'package:projet_sm/Services/chantierDB.dart';
import 'package:projet_sm/models/chantier.dart';
import 'package:projet_sm/tools/menu.dart';

import 'edit_chantier.dart';

class ChantierDetails extends StatelessWidget {

  final Chantier chantier;

  ChantierDetails({Key? key, required this.chantier}) : super(key: key);

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
        title: Text(
          chantier.name,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onSelected: (value) {
              if(value == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditChantier(chantier: chantier, id: chantier.id!)));
              }else if(value == 1){
                ChantierDB().deleteChantier(chantier);
                Navigator.pushNamed(context, "/chantiers");
              }
            },
            iconSize: 25,
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Modifier')),
              PopupMenuItem<int>(value: 1, child: Text('Supprimer'))
            ]
          ),
        ],
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Text('Nom du chantier :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: chantier.name,
              ),
            ),
            SizedBox(height: 20),
            Text('Nom du client :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: chantier.nameClient,
              ),
            ),
            SizedBox(height: 20),
            Text('Adresse :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: chantier.adresse,
              ),
            ),
            SizedBox(height: 20),
            Text('Date de début :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: chantier.dateDebut,
                suffixIcon: IconButton(icon: Icon(Icons.calendar_month), onPressed: () {},)
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width-60,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/chantiers");
            },
            child: const Text(
              'Retour',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



