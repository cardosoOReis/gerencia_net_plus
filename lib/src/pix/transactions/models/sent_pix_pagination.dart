// Project imports:
import '../../models/pagination.dart';
import 'detailed_sent_pix.dart';

class SentPixPagination {
  final Parameters parameters;
  final List<DetailedSentPix> pix;

  const SentPixPagination({required this.parameters, required this.pix});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'parametros': parameters.toMap(),
        'pix': pix.map((x) => x.toMap()).toList(),
      };

  factory SentPixPagination.fromMap(Map<String, dynamic> map) =>
      SentPixPagination(
        parameters: Parameters.fromMap(map['parametros']),
        pix: List<DetailedSentPix>.from(
          (map['pix'] as List<dynamic>).map<DetailedSentPix>(
            (x) => DetailedSentPix.fromMap(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );
}
