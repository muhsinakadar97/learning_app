import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/data/models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  Hive.registerAdapter(UserModelAdapter());

  runApp(const MyApp());

  // runApp(
  //     DevicePreview(
  //     enabled: !kReleaseMode, // Enable only in debug mode
  //     builder: (context) => const MyApp(), // Your app widget
  //     ),
  //     );
}
