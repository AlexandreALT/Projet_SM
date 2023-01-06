import 'package:flutter/material.dart';
import 'package:projet_sm/verification_code.dart';

import 'logout.dart';

void main() => runApp(const Settings());

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
        title: const Text("Paramètres", style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return const VerificationCode();
                            }));
                      },
                      child: const Text(
                        'Modifier le profil',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return const Logout();
                            }));
                      },
                      child: const Text(
                        'Se déconnecter',
                        style: TextStyle(fontSize: 20, color : Colors.red),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return const VerificationCode();
                            }));
                      },
                      child: const Text(
                        'Supprimer mon compte',
                        style: TextStyle(fontSize: 20, color : Colors.red),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
    );
  }
}