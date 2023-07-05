// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../network/models/end_point.dart';
import '../network/models/http_method.dart';

class GerenciaNetPlusRestClient extends DioForNative {
  static final _baseOptions = BaseOptions(
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  GerenciaNetPlusRestClient({
    required String certificatePath,
    required String keyPath,
  }) : super(_baseOptions) {
    _configureCertificates(certificatePath: certificatePath, keyPath: keyPath);
    interceptors.add(PrettyDioLogger(requestBody: true));
  }

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
    required String certificatePath,
    required String keyPath,
  }) {
    httpClientAdapter = Http2Adapter(
      ConnectionManager(
        onClientCreate: (uri, clientSetting) => _onClientCreate(
          uri: uri,
          clientSetting: clientSetting,
          certificatePath: certificatePath,
          keyPath: keyPath,
        ),
      ),
    );
  }

  void _onClientCreate({
    required Uri uri,
    required ClientSetting clientSetting,
    required String certificatePath,
    required String keyPath,
  }) {
    final root = Directory.current.path;
    final securityContext = SecurityContext(withTrustedRoots: true)
      ..useCertificateChain('$root/$certificatePath')
      ..usePrivateKey('$root/$keyPath');

    clientSetting.context = securityContext;
  }
}
