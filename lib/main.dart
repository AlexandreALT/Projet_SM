import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_sm/verification_code.dart';

import 'accueil.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockMag\'',
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/verification_code': (context) => const VerificationCode(),
        '/accueil': (context) => const Accueil(),
      },
      initialRoute: '/',
    );
  }
}