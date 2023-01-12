import 'package:flutter/material.dart';
import 'package:projet_sm/consumable.dart';
import 'package:projet_sm/menu.dart';
import 'package:projet_sm/search_bar.dart';
import 'package:projet_sm/tool_list.dart';

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
        title: const Text(
          "Magasin",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 15),
            ToolList(),
            SizedBox(
              height: 10,
            ),
            Consumable(
              title: 'Sac Amiante 50L',
              quantity: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Consumable(
              title: 'Sac Amiante 100L',
              quantity: 25,
            ),
            SizedBox(
              height: 10,
            ),
            Consumable(
              title: 'Sac Amiante 200L',
              quantity: 15,
            ),
            SizedBox(
              height: 10,
            ),
            Consumable(
              title: 'Sac Plomb 50L',
              quantity: 30,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width-40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_product');
            },
            child: const Text(
              'Ajouter un produit',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
