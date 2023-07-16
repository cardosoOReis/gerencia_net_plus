// Package imports:
import 'package:dio/dio.dart';
// Project imports:
import 'package:gerencia_net_plus/src/config/http_client/gerencia_net_plus_pix_rest_client.dart';
import 'package:gerencia_net_plus/src/config/network/models/end_point.dart';
import 'package:gerencia_net_plus/src/config/network/models/http_method.dart';
import 'package:gerencia_net_plus/src/config/network/pix/pix_immediate_charge_end_points.dart';
import 'package:gerencia_net_plus/src/config/network/pix_endpoints.dart';
import 'package:gerencia_net_plus/src/gerencia_net_credentials.dart';
import 'package:mocktail/mocktail.dart';

class MockGerenciaNetPlusPixRestClient extends Mock
    implements GerenciaNetPlusPixRestClient {
  @override
  PixEndPoints get pixEndPoints => MockPixEndPoints();
}

class MockPixEndPoints extends Mock implements PixEndPoints {
  @override
  PixImmediateChargeEndPoints get immediateCharge =>
      MockPixImmediateChargeEndPoints();
}

class MockPixImmediateChargeEndPoints extends Mock
    implements PixImmediateChargeEndPoints {
  @override
  EndPoint pixCreateCharge(String txid) => mockEndpoint;
  @override
  EndPoint pixDetailCharge(String txid) => mockEndpoint;
  @override
  EndPoint pixUpdateCharge(String txid) => mockEndpoint;
  @override
  EndPoint pixListCharges() => mockEndpoint;
}

const mockCredentials = GerenciaNetCredentials(
  clientId: '',
  clientSecret: '',
  certificatePath: '',
  privateKeyPath: '',
  pixKey: '',
);

const mockEndpoint = EndPoint(path: '', method: HttpMethod.post);

void setUp200Response<T>(
  Future<Response<T>> Function() call, {
  required T responseData,
}) {
  when<Future<Response<T>>>(
    call,
  ).thenAnswer(
    (_) async => Response(
      requestOptions: RequestOptions(),
      statusCode: 200,
      data: responseData,
    ),
  );
}

void setUpErrorResponse<T>(
  Future<Response<T>> Function() call, {
  int? statusCode,
  dynamic errorData,
}) {
  when<Future<Response<T>>>(call).thenThrow(
    DioException(
      requestOptions: RequestOptions(),
      message: '',
      response: Response(
        requestOptions: RequestOptions(),
        data: errorData,
        statusCode: statusCode,
      ),
    ),
  );
}
