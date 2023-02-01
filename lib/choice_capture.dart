import 'package:flutter/material.dart';
import 'package:projet_sm/tools/menu.dart';

class ChoiceCapture extends StatelessWidget {
  const ChoiceCapture({Key? key}) : super(key: key);

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
            "Choix de la saisie",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        drawer: Menu(),
        body: Column(children: [
          SizedBox(height: 50),
          Center(
            child: Container(
              width: 1000,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/scan_error');
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                    ),
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(children: [
                        Image.asset('assets/qr-code.png',
                            height: 150.0, fit: BoxFit.cover),
                        SizedBox(height: 30),
                        Text('Scan QR code', style: TextStyle(fontSize: 20))
                      ]))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: 1000,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/manual_entry');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(children: [
                        Image.asset('assets/keyboard.png',
                            height: 150.0, fit: BoxFit.cover),
                        SizedBox(height: 30),
                        Text('Saisie manuelle', style: TextStyle(fontSize: 20))
                      ]))),
            ),
          ),
        ]));
  }
}
