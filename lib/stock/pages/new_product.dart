import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Image.asset('assets/check.png', fit: BoxFit.cover),
                const SizedBox(height: 40),
                const Text(
                  'Nouveau produit créé',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
                SizedBox(height: 40),
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
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Valider',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
