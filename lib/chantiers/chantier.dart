import 'package:flutter/material.dart';
import 'package:projet_sm/models/chantier.dart';

class ChantierWidget extends StatelessWidget {

  final Chantier chantier;

  const ChantierWidget({Key? key, required this.chantier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 15),
            child: Row(
              children: [
                Text(
                 chantier.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/arrow_down.png',

                      ),
                      onPressed: () {},
                    ),
                  ],
                )
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
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
