import 'package:gerencia_net_plus/gerencia_net_plus.dart';

import '../../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);

  final locations = await gerenciaNetPlus.pix.location.listLocations(
    start: DateTime(2023),
    end: DateTime(2024),
    pageNumber: 5,
    pageSize: 4,
  );

  print(locations.toMap());
}
