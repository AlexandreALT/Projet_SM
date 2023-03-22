import 'package:flutter/material.dart';
import 'package:projet_sm/chantiers/chantier_details.dart';
import 'package:projet_sm/chantiers/listProductsChantier.dart';
import 'package:projet_sm/models/chantier.dart';
import 'package:intl/intl.dart';

class ChantierWidget extends StatefulWidget {
  const ChantierWidget({Key? key, required this.chantier}) : super(key: key);

  final Chantier chantier;

  @override
  State<ChantierWidget> createState() => _ChantierWidgetState();
}

class _ChantierWidgetState extends State<ChantierWidget> {
  bool visibility = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    bool _visibility = false;
    return Column(
      children: [
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 15),
            child: Row(
              children: [
                Text(
                  widget.chantier.name,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChantierDetails(chantier: widget.chantier)));
                      },
                    ),
                    IconButton(
                      icon: _isPressed
                          ? Image.asset('assets/arrow_up.png')
                          : Image.asset('assets/arrow_down.png'),
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                          _isPressed = !_isPressed;
                        });
                      },
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
        SizedBox(
          height: 5,
        ),
        Visibility(
          visible: visibility,
          child: ListProductsChantier(idChantier: widget.chantier.id!),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
