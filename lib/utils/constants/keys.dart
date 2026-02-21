import 'package:flutter_dotenv/flutter_dotenv.dart';

class UKeys{
  UKeys._();
  static const String userCollection='Users';

  static const String rememberMeEmail='rememberEmail';
  static const String rememberMePassword='rememberPassword';

  static const String cloudName='dstecodon';
  static const String uploadPreset='upload_image';
  static const String profileFolder='Profile Pictures';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get apiSecret => dotenv.env['API_SECRET'] ?? '';
}