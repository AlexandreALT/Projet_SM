import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/reference.dart';
import 'package:projet_sm/stock/listProducts.dart';

class ToolList extends StatefulWidget {
  ToolList({Key? key, required this.reference}) : super(key: key);

  final Reference reference;

  @override
  State<ToolList> createState() => _ToolListState();
}

class _ToolListState extends State<ToolList> {
  bool _visibility = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: ProductDB().countProducts('reference',
            widget.reference.nom + " " + widget.reference.reference),
        builder: (context, snapshot) {
          int? counter = snapshot.data;
          return Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 5, bottom: 5, left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.reference.nom,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            ' - ' + widget.reference.reference,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                counter.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                icon: _isPressed
                                    ? Image.asset('assets/arrow_up.png')
                                    : Image.asset('assets/arrow_down.png'),
                                onPressed: () {
                                  setState(() {
                                    _visibility = !_visibility;
                                    _isPressed = !_isPressed;
                                  });
                                },
                              ),
                            ],
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
              SizedBox(
                height: 5,
              ),
              Visibility(
                visible: _visibility,
                child: ListProducts(
                  ref: widget.reference.nom + " " + widget.reference.reference,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }
}
