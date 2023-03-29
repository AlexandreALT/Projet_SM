import 'package:flutter/material.dart';

import 'Services/auth.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 45,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/deconnexion.png'),
              onPressed: () async{
                Navigator.pushNamed(context, '/logout');
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
            onPressed: () {
              Navigator.pushNamed(context, '/gestion_roles');
            },
          ),
          IconButton(
            icon: Image.asset('assets/parametre.png'),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height/5),
          Container(
              child: Text("Bienvenue !",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              alignment: Alignment.center),
          SizedBox(height: MediaQuery.of(context).size.height/5),
          Column(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/choice_capture');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Image.asset('assets/arrows_icon.png',
                                height: 30, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(
                              'Entrée / Sortie',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/chantiers');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Image.asset('assets/chantier_icon.png',
                                height: 30, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(
                              'Chantiers',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/stock');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Image.asset('assets/stock_icon.png',
                                height: 30, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(
                              'Vérifier les \nstocks',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/alerts');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Image.asset('assets/alert_icon.png',
                                height: 30, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(
                              'Alertes',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Image.asset('assets/data_icon.png',
                                height: 30, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text(
                              'Exporter les \ndonnées',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: 105,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {Navigator.pushNamed(context, '/historique');},
                        child: Column(children: [
                          Image.asset('assets/sorties_icon.png',
                              height: 30, fit: BoxFit.cover),
                          SizedBox(height: 10),
                          Text(
                            'Historique des sorties',
                            style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          )
                        ])),
                  ),
                ],
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
