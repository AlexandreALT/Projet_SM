import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset('assets/info.png',
                      height: 150.0, fit: BoxFit.cover),
                  const SizedBox(height: 40),
                  const Text(
                    'Produit supprimé',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                  const SizedBox(height: 40),
                ],
              ), //SizedBox
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
                      Navigator.pushNamed(context, '/stock');
                    },
                    child: const Text(
                      'Valider',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              const SizedBox(height: 40),
            ],
          )),
    );
  }
}
