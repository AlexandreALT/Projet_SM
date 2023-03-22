import 'package:flutter/material.dart';
import 'package:projet_sm/chantiers/chantier.dart';

import '../Services/chantierDB.dart';
import '../models/chantier.dart';

class ChantierListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chantier>>(
      future: ChantierDB().getAllChantier(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ChantierWidget(chantier: snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}