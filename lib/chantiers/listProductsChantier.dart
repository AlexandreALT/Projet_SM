import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/product.dart';

class ListProductsChantier extends StatelessWidget {
  ListProductsChantier({Key? key, required this.idChantier}) : super(key: key);

  final String idChantier;

  var products = ProductDB().getAllProduct();
  List<Widget> widgetProducts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: ProductDB().getProductWhere('idChantier', idChantier),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1.0)),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15, bottom: 5),
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
