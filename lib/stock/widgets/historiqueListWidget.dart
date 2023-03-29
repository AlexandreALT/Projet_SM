import 'package:flutter/material.dart';
import 'package:projet_sm/Services/chantierDB.dart';
import 'package:projet_sm/Services/historiqueDB.dart';
import 'package:projet_sm/models/chantier.dart';
import 'package:projet_sm/models/historique.dart';
import 'package:projet_sm/stock/widgets/historiqueWidget.dart';

class HistoriqueListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Historique>>(
      future: HistoriqueDB().getAllHistorique(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final historique = snapshot.data![index];
              return FutureBuilder<Chantier>(
                future: ChantierDB().getChantierFromId(historique.chantier),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final chantierData = snapshot.data!;
                    return HistoriqueWidget(
                      historique: historique,
                      chantier: chantierData,
                    );
                  } else if (snapshot.hasError) {
                    return Text("");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("erreur");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}