// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../network/models/end_point.dart';
import '../network/models/http_method.dart';

/// Base Dio client to use during requests.
class GerenciaNetPlusRestClient extends DioForNative {
  static final _baseOptions = BaseOptions(
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  /// Default constructor.
  ///
  /// Firstly, we configure the certificates to handle Authentication.
  ///
  /// After this, we add a [PrettyDioLogger] to help logging.
  GerenciaNetPlusRestClient({
    required Uint8List certificateBytes,
    required Uint8List keyBytes,
  }) : super(_baseOptions) {
    _configureCertificates(
      certificateBytes: certificateBytes,
      keyBytes: keyBytes,
    );
    interceptors.add(PrettyDioLogger(requestBody: true));
  }

  /// Handy method to take care of HTTP calls.
  Future<Response<T>> call<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) =>
      switch (endPoint.method) {
        HttpMethod.post => _defaultPost(
            endPoint: endPoint,
            queryParameters: queryParameters,
            body: body,
          ),
        HttpMethod.get => _defaultGet(
            endPoint: endPoint,
            queryParameters: queryParameters,
          ),
        HttpMethod.put => _defaultPut(
            endPoint: endPoint,
            queryParameters: queryParameters,
            body: body,
          ),
        HttpMethod.delete => _defaultDelete(
            endPoint: endPoint,
            queryParameters: queryParameters,
          ),
        HttpMethod.patch => _defaultPatch(
            endPoint: endPoint,
            queryParameters: queryParameters,
            body: body,
          ),
      };

  Future<Response<T>> _defaultPost<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) =>
      post<T>(
        endPoint.path,
        data: body,
        queryParameters: queryParameters,
      );

  Future<Response<T>> _defaultGet<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
  }) =>
      get<T>(endPoint.path, queryParameters: queryParameters);

  Future<Response<T>> _defaultPut<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) =>
      put<T>(endPoint.path, queryParameters: queryParameters, data: body);

  Future<Response<T>> _defaultDelete<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) =>
      delete<T>(endPoint.path, queryParameters: queryParameters);

  Future<Response<T>> _defaultPatch<T>({
    required EndPoint endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) =>
      patch<T>(
        endPoint.path,
        queryParameters: queryParameters,
        data: body,
      );

  void _configureCertificates({
    required Uint8List certificateBytes,
    required Uint8List keyBytes,
  }) {
    httpClientAdapter = Http2Adapter(
      ConnectionManager(
        onClientCreate: (uri, clientSetting) => _onClientCreate(
          uri: uri,
          clientSetting: clientSetting,
          certificateBytes: certificateBytes,
          keyBytes: keyBytes,
        ),
      ),
    );
  }

  void _onClientCreate({
    required Uri uri,
    required ClientSetting clientSetting,
    required Uint8List certificateBytes,
    required Uint8List keyBytes,
  }) {
    final securityContext = SecurityContext(withTrustedRoots: true)
      ..useCertificateChainBytes(certificateBytes)
      ..usePrivateKeyBytes(keyBytes);

    clientSetting.context = securityContext;
  }
}
