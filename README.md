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

A Dart plugin that allows a better way to connect to Gerencianet - Efí Api.

Go to:

- [Getting Started](#getting-started)
  - [How to get Client_Id and Client_Secret credentials](#how-to-obtain-client-id-and-client-secret-credentials)
  - [How to generate a Pix certificate](#how-to-generate-a-pix-certificate)
  - [How to convert a Pix certificate](#how-to-convert-a-pix-certificate)
  - [Add the certificate and private key to your project](#add-the-certificate-and-private-key-to-your-project)
  - [How to register Pix keys](#how-to-register-pix-keys)
- [Usage](#usage)
- [Examples](#examples)
- [Additional Documentation](#additional-documentation)
- [License](#license)

## Features

- Create, update and list your Pix Charges, with or without additional expiration fees.

  TODO:

  - List Pix transactions
  - Webhook functionlity

## Getting started

Add `gerencia_net_plus` as a dependency in your pubspec.yaml file.

### How to obtain Client-Id and Client-Secret credentials

#### Create a new application to use the Gerencianet API

1. Access the Gerencianet dashboard and navigate to the **API** section.
2. On the left side, click on **My Applications (Minhas Aplicações)** and then **New Application (Nova Aplicação)**.
3. Enter a name for the application, enable the **Payments API (Boletos e Carnês)** and **Pix API**, and choose the scopes you want to authorize for **Production** and/or **Homologation** according to your needs (remember that these can be changed later).
4. Click on **Create New Application (Criar Nova aplicação)**.

![Create a new application to use the Gerencianet API](https://t-images.imgix.net/https%3A%2F%2Fapp-us-east-1.t-cdn.net%2F5fa37ea6b47fe9313cb4c9ca%2Fposts%2F603543ff4253cf5983339cf1%2F603543ff4253cf5983339cf1_88071.png?width=1240&w=1240&auto=format%2Ccompress&ixlib=js-2.3.1&s=2f24c7ea5674dbbea13773b3a0b1e95c)

#### Modify an existing application to use the Gerencianet API

1. Access the Gerencianet dashboard and navigate to the **API** section.
2. On the left side, click on **My Applications (Minhas Aplicações)**, choose your application, and click on the **Edit (Editar)** button (orange button).
3. Enable the **Pix API** and choose the scopes you want to authorize for **Production** and/or **Homologation** according to your needs (remember that these can be changed later).
4. Click on **Update Application**.

![Modify an existing application to use the Pix API](https://app-us-east-1.t-cdn.net/5fa37ea6b47fe9313cb4c9ca/posts/603544082060b2e9b88bc717/603544082060b2e9b88bc717_22430.png)

### How to generate a Pix certificate

All Pix requests must contain a security certificate provided by Gerencianet within your account, in PFX (.p12) format. This requirement is fully described in the [PIX Security Manual](https://www.bcb.gov.br/estabilidadefinanceira/comunicacaodados).

**To generate your certificate:**

1. Access the Gerencianet dashboard and navigate to the **API** section.
2. On the left side, click on **My Certificates** and choose the environment in which you want the certificate: **Production** or **Homologation**.
3. Click on **New Certificate**.

![To generate your certificate](https://app-us-east-1.t-cdn.net/5fa37ea6b47fe9313cb4c9ca/posts/603543f7d1778b2d725dea1e/603543f7d1778b2d725dea1e_85669.png)

### How to convert a Pix certificate

⚠️To use it in Flutter, the certificate must be converted to `.pem` format, and it is necessary to create a private key for the certificate.

You can [download the certificate converter provided by Gerencianet](https://pix.gerencianet.com.br/ferramentas/conversorGerencianet.exe).

Or use the example below by running the OpenSSL command for conversion.

#### OpenSSL Command

```bash
# Generate separate certificate and key
openssl pkcs12 -in path.p12 -out newfile.crt.pem -clcerts -nokeys #certificate
openssl pkcs12 -in path.p12 -out newfile.key.pem -nocerts -nodes #private key
```

### Add the certificate and private key to your project

In the root of your project, create a new folder called `certificates` and put your newly created certificate and private key inside.

```bash
├── certificates
│   ├── private_key.pem
│   ├── certificate.pem
├── lib
│   ├── src
│   ├── main.dart
└── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
```

### How to register Pix keys

The registration of Pix keys can be done through the Gerencianet mobile application or through an API endpoint. Below are the steps to register them.

#### Register Pix key through the mobile application

If you haven't installed our application yet, click on [Android](https://play.google.com/store/apps/details?id=br.com.gerencianet.app) or [iOS](https://apps.apple.com/br/app/gerencianet/id1443363326), according to your smartphone's operating system, to download it.

To register your Pix keys through the application:

1. Access your account through the **Gerencianet app**.
2. In the side menu, tap on **Pix** to start the registration.
3. Read the information displayed on the screen and click on **Register Key (Registrar Chave)**.
   If this is not your first registration, tap on **My Keys (Minhas Chaves)** and then on the icon (➕).
4. **Select the data** you want to register as your Pix Key and tap **Next (avançar)** – you must choose at least 1 of the 4 available key options (phone number, email, CPF, and/or random key).
5. After registering the desired Pix keys, click on **Finish (concluir)**.
6. **Done! Your keys are now registered with us.**

## Usage

```dart
import 'package:gerencia_net_plus/gerencia_net_plus.dart';

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

## Examples

You can check all the available examples by clicking [here](https://github.com/cardosoOReis/gerencia_net_plus/tree/master/example).

## Additional Documentation

Project's Github: <https://github.com/cardosoOReis/gerencia_net_plus>;

GerenciaNet Api documentation: <https://dev.gerencianet.com.br/docs>;

Official Gerencia Net Discord: <https://discord.com/invite/ptGHMtczcV>;

## License

[BSD 3-clause](https://github.com/cardosoOReis/gerencia_net_plus/blob/master/LICENSE)
