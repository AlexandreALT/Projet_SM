import 'package:flutter/material.dart';
import 'package:projet_sm/Services/categoryDB.dart';
import 'package:projet_sm/stock/widgets/form_consumable.dart';
import 'package:projet_sm/stock/widgets/form_others.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key, this.image}) : super(key: key);

  final image;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? dropdownvalue = 'Outils';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: CategoryDB().getData(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              title: const Text(
                "Ajouter un nouveau produit",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 232, 232, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: dropdownvalue,
                            items: snapshot.data?.map((item) {
                              return DropdownMenuItem(
                                  value: item['name'], child: Text(item['name']));
                            }).toList(),
                            onChanged: (var newValue) {
                              setState(() {
                                dropdownvalue = newValue as String?;
                              });
                            },
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: dropdownvalue == 'Consommable'
                            ? FormConsumable(category: dropdownvalue)
                            : FormOthers(
                                image: widget.image,
                                category: dropdownvalue,
                              )),
                  ],
                )),
          );
        });
  }
}
