// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../config/utils/date_extensions.dart';

/// Represents a devolution of a sent Pix transaction.
class SentPixDevolution extends Equatable {
  /// The unique identifier of the sent Pix devolution.
  final String rtrId;

  /// The value of the sent Pix devolution.
  final double value;

  /// The date and time when the Pix devolution occurred.
  final DateTime time;

  /// Represents a devolution of a sent Pix transaction.
  const SentPixDevolution({
    required this.rtrId,
    required this.value,
    required this.time,
  });

  @override
  List<Object> get props => [rtrId, value, time];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'rtrId': rtrId,
        'valor': value.toStringAsFixed(2),
        'time': time.toRFC3339(),
      };

  factory SentPixDevolution.fromMap(Map<String, dynamic> map) =>
      SentPixDevolution(
        rtrId: map['rtrId'] as String,
        value: double.parse(map['valor']),
        time: DateTime.parse(map['horario']),
      );
}
