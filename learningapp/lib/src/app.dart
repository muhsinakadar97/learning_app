import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'presentation/bindings/connectivity_binding.dart';
import 'presentation/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ConnectivityBinding(),
        // builder:
        //     DevicePreview.appBuilder, // Add this line to apply the preview mode
        // home: ItemPage());

        home: const Splash());
  }
}
