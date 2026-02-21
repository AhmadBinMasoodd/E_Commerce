import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/my_app.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  final widgetBinding=WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await GetStorage.init();
  Get.put(NetworkManager());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value){
    Get.put(AuthenticationRepository());
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}


