import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/token.dart';
import '../../../gerencia_net_credentials.dart';
import '../../network/app_network.dart';
import '../gerencia_net_plus_rest_client.dart';

class GerenciaNetPlusPixAuthInterceptor extends Interceptor {
  final GerenciaNetCredentials _credentials;
  final PixEndPoints _pixEndPoints;

  const GerenciaNetPlusPixAuthInterceptor({
    required GerenciaNetCredentials credentials,
    required PixEndPoints pixEndPoints,
  })  : _pixEndPoints = pixEndPoints,
        _credentials = credentials;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _authorize();

    options.headers.addAll({
      'authorization': 'Bearer ${token.accessToken}',
      'content-type': 'application/json',
    });

    options.contentType = 'application/json';
    handler.next(options);
  }

  Future<Token> _authorize() async {
    final client = GerenciaNetPlusRestClient(
      certificatePath: _credentials.certificatePath,
      keyPath: _credentials.privateKeyPath,
    );

    final headers = {
      'authorization': 'Basic ${_getAuthorization()}',
      'content-type': 'application/json'
    };

    final result = await client.post(
      _pixEndPoints.authorize().path,
      data: {
        'grant_type': 'client_credentials',
      },
      options: Options(
        headers: headers,
        contentType: 'application/json',
      ),
    );

    return Token.fromMap(result.data);
  }

  String _getAuthorization() {
    final authBytes =
        utf8.encode('${_credentials.clientId}:${_credentials.clientSecret}');

    return base64Encode(authBytes);
  }
}
