import 'package:flutter/material.dart';
import 'package:projet_sm/tools/menu.dart';

class EditChantier extends StatelessWidget {
  EditChantier({Key? key}) : super(key: key);

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
          "Modifier le chantier",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Nom',
                  suffixIcon: IconButton(icon: Icon(Icons.edit), onPressed: () {},)
              ),
              initialValue: 'Nom',
            ),
            SizedBox(height: 15),
            Text('Nom du client :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.text,
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
                hintText: 'Nom du client',
              ),
              initialValue: 'Nom du client',
            ),
            SizedBox(height: 15),
            Text('Adresse :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.text,
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
                hintText: 'Adresse',
              ),
              initialValue: 'Adresse',
            ),
            SizedBox(height: 15),
            Text('Date de début :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
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
                  hintText: '',
                  suffixIcon: IconButton(icon: Icon(Icons.calendar_month), onPressed: () {},)
              ),
              initialValue: '10/07/2022',
            ),
            SizedBox(height: 15),
            Text('Date de fin :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
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
                  suffixIcon: IconButton(icon: Icon(Icons.calendar_month), onPressed: () {},)
              ),
            ),
            SizedBox(height: 25),
            Container(
                height: 50,
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
                    'Valider',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Annuler',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}