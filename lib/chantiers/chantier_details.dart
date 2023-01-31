import 'package:flutter/material.dart';
import 'package:projet_sm/tools/menu.dart';

class ChantierDetails extends StatelessWidget {
  const ChantierDetails({Key? key}) : super(key: key);

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
        title: const Text(
          "Détails du chantier",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/edit_chantier');
            },
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Tourmaniantz',
              ),
            ),
            SizedBox(height: 20),
            Text('Nom du client :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Mairie de Lille',
              ),
            ),
            SizedBox(height: 20),
            Text('Adresse :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Rue Yervant Tourmaniantz',
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
                hintText: '10/07/2022',
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
              Navigator.pop(context);
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
