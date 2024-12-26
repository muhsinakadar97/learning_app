import 'package:get/get.dart';

import '../controllers/connectivity_controller.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(ConnectivityController(), permanent: true);
  }
}
