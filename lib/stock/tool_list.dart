import 'package:flutter/material.dart';

class ToolList extends StatelessWidget {
  const ToolList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5, right: 5, bottom: 5, left: 15),
        child: Row(
          children: [
            Text(
              'Burineur - réf',
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/info_product');
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
    );
  }
}
