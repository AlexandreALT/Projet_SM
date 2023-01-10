import 'package:flutter/material.dart';
import 'package:projet_sm/menu.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

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
        title: const Text("Magasin", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      drawer: Menu(),
    );
  }
}
