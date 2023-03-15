import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Magasinier',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            title: Text('Accueil'),
            onTap: () => {
              Navigator.pushNamed(context, '/accueil'),
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/arrows_icon.png',
              color: Colors.black,
              height: 25,
            ),
            title: Text('Entrée / Sortie'),
            onTap: () => {
              Navigator.pushNamed(context, '/choice_capture'),
            },
          ),
          ListTile(
            leading: Image.asset('assets/sorties_icon.png',
                color: Colors.black, height: 25),
            title: Text('Historique sorties'),
            onTap: () => {Navigator.pushNamed(context, '/historique')},
          ),
          ListTile(
            leading: Image.asset('assets/stock_icon.png',
                color: Colors.black, height: 25),
            title: Text('Magasin'),
            onTap: () => {Navigator.pushNamed(context, '/stock'),},
          ),
          ListTile(
            leading: Image.asset('assets/chantier_icon.png',
                color: Colors.black, height: 25),
            title: Text('Chantiers'),
            onTap: () => {Navigator.pushNamed(context, '/chantiers'),},
          ),
          ListTile(
            leading: Image.asset('assets/alert_icon.png',
                color: Colors.black, height: 25),
            title: Text('Alertes'),
            onTap: () => {Navigator.pushNamed(context, '/alerts'),},
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Gestion',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading:
                Image.asset('assets/role.png', color: Colors.black, height: 25),
            title: Text('Rôles'),
            onTap: () => {Navigator.pushNamed(context, '/gestion_roles'),},
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Compte',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Image.asset('assets/parametre.png',
                color: Colors.black, height: 25),
            title: Text('Paramètres'),
            onTap: () => {Navigator.pushNamed(context, '/settings'),},
          ),
          ListTile(
            leading: Image.asset('assets/deconnexion.png', height: 22.5),
            title: Text(
              'Déconnexion',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () => {Navigator.pushNamed(context, '/logout'),},
          ),
          ListTile(
            leading: Image.asset('assets/quitter.png', height: 30),
            title: Text(
              'Quitter',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () => {Navigator.pushNamed(context, '/leave_app'),},
          ),
        ],
      ),
    );
  }
}
