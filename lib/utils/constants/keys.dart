import 'package:flutter_dotenv/flutter_dotenv.dart';

class UKeys{
  UKeys._();
  static const String userCollection='Users';
  static const String categoryCollection='Categories';
  static const String bannersCollection='Banners';
  static const String brandsCollection='Brands';
  static const String productCollection='Products';

  static const String rememberMeEmail='rememberEmail';
  static const String rememberMePassword='rememberPassword';

  static const String cloudName='dstecodon';
  static const String uploadPreset='upload_image';
  static const String profileFolder='Profile Pictures';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get apiSecret => dotenv.env['API_SECRET'] ?? '';

  static const String categoryFolder='Category Pictures';
  static const String bannersFolder='Banners Pictures';
  static const String brandsFolder='Brands Pictures';
  static const String productsFolder='Products Pictures';

}