import 'package:flutter/material.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {},
            );
          },
        ),
        title: const Text("Magasin", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
    );
  }
}
