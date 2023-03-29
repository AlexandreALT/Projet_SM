import 'package:flutter/material.dart';
import 'package:projet_sm/chantiers/chantier.dart';

import '../Services/chantierDB.dart';
import '../models/chantier.dart';

class SelectChantierListWidget extends StatefulWidget {
  final Function(String?) onChanged;

  SelectChantierListWidget({required this.onChanged, Key? key}) : super(key: key);
  @override
  _SelectChantierListWidgetState createState() =>
      _SelectChantierListWidgetState();
}

class _SelectChantierListWidgetState extends State<SelectChantierListWidget> {
  String _selectedChantierId = "YgF6enUZWycfQzG9U1wX";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chantier>>(
      future: ChantierDB().getAllChantier(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButton(
            hint: Text("Sélectionner un chantier"),
            value: _selectedChantierId,
            items: snapshot.data!.map((Chantier chantier) {
              return DropdownMenuItem(
                value: chantier.id.toString(),
                child: Text(chantier.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedChantierId = value!;
                widget.onChanged(value);
              });
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