import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/stock/pages/info_product.dart';

class ListProducts extends StatelessWidget {
  ListProducts({Key? key, required this.ref}) : super(key: key);

  final String ref;

  var products = ProductDB().getAllProduct();
  List<Widget> widgetProducts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: ProductDB().getProductWhere('reference', ref),
        builder: (context, snapshot) {
          int countStock = 0;
          int countChantier = 0;
          if (snapshot.data != null) {
            for (Product product in snapshot.data!) {
              if (product.statut == 'En entrepôt')
                countStock += 1;
              else
                countChantier += 1;
            }
            return Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1.0)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          countChantier.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 3),
                        Image.asset('assets/tractopelle.png', width: 25),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          countStock.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 5),
                        Image.asset('assets/entrepot.png', width: 20),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 15, right: 15, bottom: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data![index].numeroSerie!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    if (snapshot.data![index].statut ==
                                        "En chantier")
                                      Image.asset('assets/tractopelle.png',
                                          width: 25),
                                    SizedBox(width: 20),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InfoProduct(
                                                  product:
                                                      snapshot.data![index])),
                                        );
                                      },
                                      icon: Icon(Icons.search),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
