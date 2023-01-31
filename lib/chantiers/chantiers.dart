import 'package:flutter/material.dart';
import 'package:projet_sm/Services/chantierDB.dart';
import 'package:projet_sm/chantiers/chantier.dart';
import 'package:projet_sm/chantiers/chantierListWidget.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

class Chantiers extends StatelessWidget{
  Chantiers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
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
        title: const Text("Chantiers", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children:[
            SearchBar(),
            Expanded(
                child: ChantierListWidget()
            ),
          ]
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
              Navigator.pushNamed(context, '/add_chantier');
            },
            child: const Text(
              'Ajouter un chantier',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
