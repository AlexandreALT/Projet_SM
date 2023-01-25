import 'package:flutter/material.dart';
import 'package:projet_sm/roles/role.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({Key? key}) : super(key: key);

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
        title: const Text("Produit", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            const Text(
              'En entrepôt',
              textAlign : TextAlign.center,
              style: TextStyle(fontSize: 23),
            ),
            Container(
              height: MediaQuery.of(context).size.height-500,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.blue)
              ),
              child: Text("Burineur SDS Max MH 5",textAlign : TextAlign.center,),
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
              Navigator.pushNamed(context, '/modif_product');
            },
            child: const Text(
              'Modifier ce produit',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
