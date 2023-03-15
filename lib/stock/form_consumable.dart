import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/product.dart';

class FormConsumable extends StatefulWidget {
  FormConsumable({Key? key, this.category}) : super(key: key);

  final category;

  @override
  State<FormConsumable> createState() => _FormConsumableState();
}

class _FormConsumableState extends State<FormConsumable> {
  String? dropdownvalue = 'Sac d\'amiante 50L';
  var quantitecontroller = TextEditingController();
  var refcontroller = TextEditingController();
  var coutcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cpt = 0;
    return FutureBuilder(
        future: ProductDB().getAllConsumable(),
        builder: (context, snapshot) {
          var newConso = new Product(
              categorie: "Consommable",
              reference: "Nouveau consommable",
              date_ajout: "",
              cout: 1);
          cpt += 1;
          if (cpt > 1) snapshot.data?.add(newConso);
          return Scaffold(
            body: ListView(children: [
              Center(
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
                                  value: item.reference,
                                  child: Text(item.reference));
                            }).toList(),
                            onChanged: (var newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          dropdownvalue == "Nouveau consommable"
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: refcontroller,
                                      keyboardType: TextInputType.text,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0))),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(232, 232, 232, 1.0),
                                        hintText: 'Référence',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: coutcontroller,
                                      keyboardType: TextInputType.number,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0))),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(232, 232, 232, 1.0),
                                        hintText: 'Coût',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 20,
                                ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: quantitecontroller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        filled: true,
                        fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                        hintText: 'Quantité au magasin',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 2.5),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            onPressed: () async {
                              if (dropdownvalue == "Nouveau consommable") {
                                var addConso = new Product(
                                    categorie: "Consommable",
                                    reference: refcontroller.text,
                                    cout: int.parse(coutcontroller.text),
                                    quantite:
                                        int.parse(quantitecontroller.text));
                                ProductDB().addConsumable(addConso);
                              } else {
                                var conso = await ProductDB().getProductWhere(
                                    "reference", dropdownvalue!);
                                var consoQte = conso[0].quantite! +
                                    int.parse(quantitecontroller.text);
                                var addConso = new Product(
                                    categorie: conso[0].categorie,
                                    reference: conso[0].reference,
                                    cout: conso[0].cout,
                                    quantite: consoQte);
                                ProductDB().updateConsumable(addConso);
                              }
                              Navigator.pushNamed(context, '/new_product');
                            },
                            child: const Text(
                              'Ajouter au magasin',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Annuler',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
