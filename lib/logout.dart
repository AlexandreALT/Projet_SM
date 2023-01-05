import 'package:flutter/material.dart';
import 'package:projet_sm/accueil.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/verification_code.dart';

import 'login.dart';

void main() => runApp(const Logout());

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

var _passwordVisible = false;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  'Voulez-vous vous déconnecter ?',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
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
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const Login();
                        }));
                  },
                  child: const Text(
                    'Oui',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            const SizedBox(height: 40),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const Settings();
                        }));
                  },
                  child: const Text(
                    'Non',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ));
  }
}
