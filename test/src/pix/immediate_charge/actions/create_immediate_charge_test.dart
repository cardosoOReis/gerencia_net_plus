// Package imports:
// Project imports:
import 'package:gerencia_net_plus/src/core/gerencia_net_exception.dart';
import 'package:gerencia_net_plus/src/pix/immediate_charge/actions/create_immediate_charge.dart';
import 'package:gerencia_net_plus/src/pix/immediate_charge/models/immediate_charge.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../pix_maps.dart';
import '../../pix_mocks.dart';

void main() {
  late CreateCharge createCharge;
  late MockGerenciaNetPlusPixRestClient mockClient;

  setUp(() {
    registerFallbackValue(mockEndpoint);
    mockClient = MockGerenciaNetPlusPixRestClient();
    createCharge = CreateCharge(mockClient);
  });

  group('When [CreateCharge.call] is called,', () {
    group('and the call is successful,', () {
      test(
        'and the parse is successful, should return an [ImmediateCharge].',
        () async {
          //Arrange
          setUp200Response<Map<String, dynamic>>(
            () => mockClient(
              endPoint: any(named: 'endPoint'),
              body: any(named: 'body'),
            ),
            responseData: mockCreateImmediateChargeMap,
          );

          //Act
          final result = await createCharge(
            credentials: mockCredentials,
            value: 0,
          );

          //Assert
          expect(result, isA<ImmediateCharge>());
        },
      );
      test(
        'and the parse is unsuccessful, should throw a [Exception]',
        () async {
          // Arrange
          setUp200Response<Map<String, dynamic>>(
            () => mockClient(
              endPoint: any(named: 'endPoint'),
              body: any(named: 'body'),
            ),
            responseData: mockInvalidMap,
          );

          // Act
          final call = createCharge.call;

          // Assert
          expect(
            () async => call(
              credentials: mockCredentials,
              value: 0,
            ),
            throwsA(isA<Error>()),
          );
        },
      );
    });
    group('and the call is unsuccessful,', () {
      test('should throw a [GerenciaNetException].', () async {
        //Arrange
        setUpErrorResponse<Map<String, dynamic>>(
          () => mockClient(
            endPoint: any(named: 'endPoint'),
            body: any(named: 'body'),
          ),
          statusCode: 400,
          errorData: mockPixChargeErrorMap,
        );

        //Act
        final result = createCharge(
          credentials: mockCredentials,
          value: 0,
        );

        //Assert
        expect(
          result,
          throwsA(isA<GerenciaNetException>()),
        );
      });
    });
  });
}
