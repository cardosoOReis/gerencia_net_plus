import 'dart:async';
import 'dart:io';

abstract interface class CertificateLoader {
  FutureOr<SecurityContext> call({
    required String certificatePath,
    required String privateKeyPath,
  });
}
