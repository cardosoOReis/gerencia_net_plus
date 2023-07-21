import 'dart:async';

import 'dart:io';

import 'certificate_loader.dart';

class DartCertificateLoader implements CertificateLoader {
  @override
  FutureOr<SecurityContext> call({
    required String certificatePath,
    required String privateKeyPath,
  }) {
    final securityContext = SecurityContext(withTrustedRoots: true)
      ..useCertificateChain(certificatePath)
      ..usePrivateKey(privateKeyPath);

    return securityContext;
  }
}
