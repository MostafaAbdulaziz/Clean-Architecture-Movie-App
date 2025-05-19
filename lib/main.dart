import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/core/services/service_locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  ServiceLocator.init();
  runApp(const Movies());
}
