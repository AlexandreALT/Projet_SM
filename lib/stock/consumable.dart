import 'package:flutter/material.dart';

class Consumable extends StatelessWidget {
  Consumable({Key? key, required this.quantity, required this.reference})
      : super(key: key);

  final String reference;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 17, right: 15, bottom: 17, left: 15),
            child: Row(
              children: [
                Text(
                  reference,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(quantity.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
