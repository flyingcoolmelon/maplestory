import 'package:applestory/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:applestory/controller/character.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(MyApp()));
}
