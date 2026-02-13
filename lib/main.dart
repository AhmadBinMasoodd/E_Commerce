import 'package:e_commerce/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  //final widgetBinding=WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}


