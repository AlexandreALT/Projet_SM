import 'package:flutter/material.dart';
import 'package:projet_sm/accueil.dart';

class Alerts extends StatelessWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.blue,),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return const Accueil();
                    }));
              },
            );
          },
        ),
        title: const Text(
          "Mes alertes",
          style: TextStyle(color: Colors.blue, fontSize: 25),
        ),
      ),
    );
  }
}
