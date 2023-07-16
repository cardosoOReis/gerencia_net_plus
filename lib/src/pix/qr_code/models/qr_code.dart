import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class QrCode extends Equatable {
  final Uint8List image;
  final String copyPasteValue;
  final Uri link;

  const QrCode({
    required this.image,
    required this.copyPasteValue,
    required this.link,
  });

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

  Map<String, dynamic> toMap() => <String, dynamic>{
        'imagem': base64Encode(image),
        'copiaCola': copyPasteValue,
        'linkVisualizacao': link,
      };

  @override
  List<Object> get props => [image, copyPasteValue, link];
}
