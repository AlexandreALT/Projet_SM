import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeaveApp extends StatelessWidget {
  const LeaveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/quitter.png', color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        "Voulez-vous quitter \nl'application ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
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
                      SystemNavigator.pop();
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Non',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          )),
    );
  }
}
