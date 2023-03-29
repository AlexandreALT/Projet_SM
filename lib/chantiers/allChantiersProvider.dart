import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projet_sm/Services/chantierDB.dart';
import 'package:projet_sm/models/chantier.dart';

final allChantiersProvider = FutureProvider<List<Chantier>>(((ref) async {
    List<Chantier> chantiers = await ChantierDB().getAllChantier();
    return chantiers;
}));