import 'package:flutter/material.dart';
import 'package:projet_sm/stock/widgets/historiqueListWidget.dart';

import '../../tools/menu.dart';

class Historique extends StatelessWidget {
  const Historique({Key? key}) : super(key: key);

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
        title: const Text("Historique", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children:[
              Expanded(
                  child: HistoriqueListWidget()
              ),
            ]
        ),
      ),
    );
  }
}