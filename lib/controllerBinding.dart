import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'app/controllers/WorkController.dart';

class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<WorkController>(() => WorkController());
    // Get.lazyPut<ThemeController>(() => ThemeController());
  }
}