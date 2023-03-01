import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_sm/accueil.dart';
import 'package:projet_sm/affect_site.dart';
import 'package:projet_sm/chantiers/add_chantier.dart';
import 'package:projet_sm/chantiers/new_chantier.dart';
import 'package:projet_sm/choice_capture.dart';
import 'package:projet_sm/firebase_options.dart';
import 'package:projet_sm/log/login.dart';
import 'package:projet_sm/retour_success.dart';
import 'package:projet_sm/roles/gestion_roles.dart';
import 'package:projet_sm/scan_error.dart';
import 'package:projet_sm/affect_success.dart';
import 'package:projet_sm/scan_result.dart';
import 'package:projet_sm/stock/add_category.dart';
import 'package:projet_sm/stock/add_product.dart';
import 'package:projet_sm/stock/add_reference.dart';
import 'package:projet_sm/alerts.dart';
import 'package:projet_sm/chantiers/chantiers.dart';
import 'package:projet_sm/profile/edit_profile.dart';
import 'package:projet_sm/log/leave_app.dart';
import 'package:projet_sm/stock/choice_picture.dart';
import 'package:projet_sm/stock/delete_product.dart';
import 'package:projet_sm/stock/new_category.dart';
import 'package:projet_sm/stock/new_product.dart';
import 'package:projet_sm/stock/new_reference.dart';
import 'package:projet_sm/stock/info_product.dart';
import 'package:projet_sm/stock/modif_product.dart';
import 'package:projet_sm/stock/verif_delete_product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/profile/profile.dart';
import 'package:projet_sm/settings.dart';
import 'package:projet_sm/stock/stock.dart';
import 'package:projet_sm/log/verification_code.dart';
import 'package:projet_sm/log/logout.dart';

import 'Services/auth.dart';
import 'chantiers/chantier_details.dart';
import 'chantiers/edit_chantier.dart';
import 'manual_entry.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.camera}) : super(key: key);

  final camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: AuthService().userChanged,
        builder: (context, snapshot){
          return snapshot.data == null ? Login() : Accueil();
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'StockMag\'',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // Log :
        '/leave_app': (context) => new LeaveApp(),
        '/logout': (context) => new Logout(),
        '/verification_code': (context) => new VerificationCode(),

        // Chantiers :
        '/chantiers': (context) => new Chantiers(),
        '/add_chantier': (context) => new AddChantier(),
        '/new_chantier': (context) => new NewChantier(),

        // Profile :
        '/profile': (context) => new Profile(),
        '/edit_profile': (context) => new EditProfile(),

        // Stock :
        '/add_category': (context) => new AddCategory(),
        '/add_product': (context) => new AddProduct(image: null),
        '/add_reference': (context) => new AddReference(),
        '/choice_picture': (context) => new ChoicePicture(camera: camera,),
        '/new_category': (context) => new NewCategory(),
        '/new_product': (context) => new NewProduct(),
        '/new_reference': (context) => new NewReference(),
        '/stock': (context) => new Stock(),
        '/modif_product': (context) => new ModifProduct(image: null),
        '/verif_delete_product': (context) => new VerifDeleteProduct(),
        '/delete_product': (context) => new DeleteProduct(),


        // Rôles :
        '/gestion_roles' :(context) => new GestionRoles(),

        // Tools :
        '/menu': (context) => new Menu(),

        '/accueil': (context) => new Accueil(),
        '/alerts': (context) => new Alerts(),
        '/choice_capture': (context) => new ChoiceCapture(),
        '/settings': (context) => new Settings(),
        '/manual_entry': (context) => new ManualEntry(),
        '/scan_error': (context) => new ScanError(),
        '/affect_success': (context) => new AffectSuccess(),
        '/retour_success': (context) => new RetourSuccess(),
      },
    );
  }
}
