import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_sm/accueil.dart';
import 'package:projet_sm/choice_capture.dart';
import 'package:projet_sm/log/login.dart';
import 'package:projet_sm/stock/add_category.dart';
import 'package:projet_sm/stock/add_product.dart';
import 'package:projet_sm/stock/add_reference.dart';
import 'package:projet_sm/alerts.dart';
import 'package:projet_sm/chantiers.dart';
import 'package:projet_sm/profile/edit_profile.dart';
import 'package:projet_sm/log/leave_app.dart';
import 'package:projet_sm/stock/choice_picture.dart';
import 'package:projet_sm/stock/new_category.dart';
import 'package:projet_sm/stock/new_product.dart';
import 'package:projet_sm/stock/new_reference.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/profile/profile.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/stock/stock.dart';
import 'package:projet_sm/log/verification_code.dart';
import 'package:projet_sm/log/logout.dart';


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
        '/edit_profile': (context) => new EditProfile(),
        '/add_product': (context) => new AddProduct(),
        '/add_category': (context) => new AddCategory(),
        '/add_reference': (context) => new AddReference(),
        '/new_category': (context) => new NewCategory(),
        '/new_reference': (context) => new NewReference(),
        '/choice_picture': (context) => new ChoicePicture(),
        '/new_product': (context) => new NewProduct(),
      },
    );
  }
}
