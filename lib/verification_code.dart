import 'package:flutter/material.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //const SizedBox(height: 10),
                  Image.asset('assets/logo.png',
                      height: 200.0, fit: BoxFit.cover),
                  const Text(
                    'StockMag\'',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Un SMS contenant votre code de récupération a été envoyé au 06 ** ** ** 28 pour vérifier qu’il s’agit bien de vous',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  labelText: 'Code de vérification',
                  hintText: 'Entrez le code',
                  filled: true,
                  fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                ),
              ),
              const SizedBox(height: 50), //SizedBox
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Vérifier le code',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          )),
    );
  }
}
