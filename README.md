<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# gerencia_net_plus

A flutter library that gives a better way to connect to Gerencia Net - Efí Api.

## Features

- Create, update and list your Pix Charges, with or without additional expiration fees.
TODO: 
    - List Pix transactions
    - Webhook functionlity

## Getting started

Firstly, follow the steps to convert your .p12 certificate into a .pem certificate and a .pem private key: https://dev.gerencianet.com.br/docs/dart#convertendo-o-certificado-p12
After you have both files, create a certificates folder in the root of your project, and add your newly created .pem files into it.
With this done, get your Client_Id, Client_Secret, and one of the Pix Keys you have connected to your account, and you can use this library!

## Usage

Add ```gerencia_net_plus``` as a dependency in your pubspec.yaml file.

### Example

```dart
const gerenciaNetPlus = GerenciaNetPlus(
    credentials: GerenciaNetCredentials(
      clientId: 'Client_Id',
      clientSecret: 'Client_Secret',
      certificatePath: 'certificates/certificate_path.pem',
      privateKeyPath: 'certificates/private_key_path.pem',
      pixKey: 'pixKey',
      sandbox: true,
    ),
  );

final newCharge = await gerenciaNetPlus.pix.immediateCharge.createCharge(value: 100);
```

## Additional information

Project's Github: https://github.com/cardosoOReis/gerencia_net_plus;
GerenciaNet Api documentation: https://dev.gerencianet.com.br/docs;
Official Gerencia Net Discord: https://discord.com/invite/ptGHMtczcV;

You can find examples for every action in the examples/ folder.
