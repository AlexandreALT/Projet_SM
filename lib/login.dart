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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  height: -0.5,
                ),
                hintText: 'Entrez votre adresse mail',
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText:
              !_passwordVisible, //This will obscure text dynamically
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                labelText: 'Mot de passe',
                labelStyle: const TextStyle(
                  height: -0.5,
                ),
                hintText: 'Entrez votre mot de passe',
                filled: true,
                fillColor: const Color.fromRGBO(232, 232, 232, 1),

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
                'Mot de passe oublié ?',
                style: TextStyle(fontSize: 10),
              ),
            ),
            Row(children: <Widget>[
              Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(width: 2, color: Colors.black),
                ),
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
                  onPressed: () {
                  },
                  child: const Text('Connexion',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ));
  }
}