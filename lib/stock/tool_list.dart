import 'package:flutter/material.dart';
import 'package:projet_sm/models/reference.dart';
import 'package:projet_sm/stock/info_product.dart';

import '../models/product.dart';

class ToolList extends StatelessWidget {

  final Reference reference;

  ToolList({Key? key, required this.reference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 15),
            child: Row(
              children: [
                Text(
                  reference.nom,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' - ' + reference.reference,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'quantite',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        //Navigator.pushReplacement<void, void>(
                          //context,
                          //MaterialPageRoute<void>(
                          //  builder: (BuildContext context) =>
                          //      InfoProduct(product: product),
                          //),
                        //);
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/arrow_down.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
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
