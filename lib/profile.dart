import 'package:flutter/material.dart';
import 'package:projet_sm/menu.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
          "Mon compte",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Container(
              child: Center(
                child: const Text(
                  'Nom Prénom',
                  style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              width: 300,
              height: 50,
            ),
            SizedBox(height: 30),
            Text('Rôle : ...',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            Text('Numéro de téléphone :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('06 12 34 56 78',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color.fromRGBO(232, 232, 232, 1.0),
              ),
              height: 50,
            ),
            SizedBox(height: 20),
            Text('Adresse mail :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('mail@mail.fr',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color.fromRGBO(232, 232, 232, 1.0),
              ),
              height: 50,
            ),
            SizedBox(height: 20),
            Text('Mot de passe :',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('***mdp***',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color.fromRGBO(232, 232, 232, 1.0),
              ),
              height: 50,
            ),
            SizedBox(height: 200),
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
                    'Retour',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
