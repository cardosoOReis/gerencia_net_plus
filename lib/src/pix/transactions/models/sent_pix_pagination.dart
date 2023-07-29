// Project imports:
import '../../models/pagination.dart';
import 'detailed_sent_pix.dart';

/// Represents a pagination result containing a list of sent Pix transactions.
class SentPixPagination {
  /// The parameters used for pagination.
  final Parameters parameters;

  /// The list of detailed sent Pix transactions in this pagination result.
  final List<DetailedSentPix> pix;

  /// Represents a pagination result containing a list of sent Pix transactions.
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
