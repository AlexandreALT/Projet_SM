import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_sm/alerts.dart';
import 'package:projet_sm/chantiers.dart';
import 'package:projet_sm/leave_app.dart';
import 'package:projet_sm/menu.dart';
import 'package:projet_sm/profile.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/stock.dart';
import 'package:projet_sm/verification_code.dart';
import 'package:projet_sm/logout.dart';

import 'accueil.dart';
import 'choice_capture.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockMag\'',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => new Login(),
        '/accueil': (context) => new Accueil(),
        '/alerts': (context) => new Alerts(),
        '/chantiers': (context) => new Chantiers(),
        '/choice_capture': (context) => new ChoiceCapture(),
        '/logout': (context) => new Logout(),
        '/settings': (context) => new Settings(),
        '/stock': (context) => new Stock(),
        '/verification_code': (context) => new VerificationCode(),
        '/menu': (context) => new Menu(),
        '/leave_app': (context) => new LeaveApp(),
        '/profile': (context) => new Profile(),
      },
    );
  }
}
