import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 15, right: 5, bottom: 15, left: 15),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width-270,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/gestion_role');
                  },
                  child: const Text(
                    'Gérer le rôle',
                    style: TextStyle(fontSize: 10),
                  ),
                )),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
