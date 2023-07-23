// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:equatable/equatable.dart';

/// Represents a QR code object used for payments or other transactions.
///
/// The QrCode class encapsulates information related to a QR code, including
/// its image data, copy-paste value, and associated link for visualization.
/// This class is particularly useful for  displaying QR codes within your
/// application.
class QrCode extends Equatable {
  /// The Uint8List representation of the QR code image.
  ///
  /// The QR code image is typically generated from a charge. If you are using
  /// Flutter, simply use the [Image.memory] and pass this value to show a QR
  /// Code image of this charge.
  final Uint8List image;

  /// The copy and paste value of this QR Code.
  final String copyPasteValue;

  /// Responsive link to get the Pix charge related to this QR Code.
  ///
  /// It's possible to customize the logo and primary color of this page by
  /// dedfining them in your [account configurations](https://gerencianet.com.br/blog/personalizar-cobranca-293/https://gerencianet.com.br/blog/personalizar-cobranca-293/k).
  final Uri link;

  /// Represents a QR code object used for payments or other transactions.
  ///
  /// The QrCode class encapsulates information related to a QR code, including
  /// its image data, copy-paste value, and associated link for visualization.
  /// This class is particularly useful for  displaying QR codes within your
  /// application.
  const QrCode({
    required this.image,
    required this.copyPasteValue,
    required this.link,
  });

  /// Handy map to parse a QrCode from a map.
  factory QrCode.fromMap(Map<String, dynamic> map) {
    final String imageComplete = map['imagemQrcode'];
    final bytes = imageComplete.split(',')[1];
    final image = base64Decode(bytes);

    return QrCode(
      image: image,
      copyPasteValue: map['qrcode'],
      link: Uri.parse(map['linkVisualizacao']),
    );
  }

  /// Handy map to convert a QrCode to a map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'imagem': base64Encode(image),
        'copiaCola': copyPasteValue,
        'linkVisualizacao': link,
      };

  @override
  List<Object> get props => [image, copyPasteValue, link];
}
