import 'package:flutter/material.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
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
                  Image.asset('assets/logo.png', height: 200.0, fit: BoxFit.cover),
                  const Text('StockMag\'', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 40),),
                  const SizedBox(height: 20),
                ],
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Connexion',
                  style: TextStyle(fontSize: 20),
                )),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Adresse mail',
                hintText: 'Entrez votre adresse mail',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText:
              !_passwordVisible, //This will obscure text dynamically
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintText: 'Entrez votre mot de passe',

                // Here is key idea
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Mot de Passe Oublié',
              ),
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 10,
              ), //SizedBox

              Checkbox(
                value: _value,
                onChanged: (bool? val){
                  setState(() {
                    _value = val;
                  });
                },
              ),
              const Text(
                'Rester connecté ',
                style: TextStyle(fontSize: 17.0),
              ),
            ]),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Connexion'),
                  onPressed: () {
                  },
                )),
          ],
        ));
  }
}