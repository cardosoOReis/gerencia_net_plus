// Dart imports:
import 'dart:convert';

// Project imports:
import '../../../models/pagination.dart';
import '../../../models/recieved_pix.dart';

class RecievedPixPagination {
  final Parameters parameters;
  final List<RecievedPix> pix;

  const RecievedPixPagination({required this.parameters, required this.pix});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'pix': pix.map((x) => x.toMap()).toList(),
      };

  factory RecievedPixPagination.fromMap(Map<String, dynamic> map) =>
      RecievedPixPagination(
        parameters: Parameters.fromMap(map['parametros']),
        pix: List<RecievedPix>.from(
          (map['pix'] as List<dynamic>).map<RecievedPix>(
            (x) => RecievedPix.fromMap(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );

  String toJson() => json.encode(toMap());

  factory RecievedPixPagination.fromJson(String source) =>
      RecievedPixPagination.fromMap(json.decode(source));
}
