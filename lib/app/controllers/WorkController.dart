import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/WorkModels.dart';
import '../services/WorkServices.dart';

class WorkController extends GetxController {

  WorkServices workServices = WorkServices();
  var isLoading = false.obs;
  var carPhotos = <WorkModels>[].obs;

  static WorkController get carGarage => Get.find();

  Future<dynamic> listParkingSpot()  async {
    isLoading.value = true;
    var list = await workServices.listCar();
    carPhotos.value = list.listParkingSpotModel;
    isLoading.value = false;
    update();
    return carPhotos;
  }

  Future<dynamic> editCar(WorkModels objeto)  async {
    isLoading.value = true;
    var response = await workServices.editCar(objeto);
    isLoading.value = false;
    update();
    return response;
  }

  Future<dynamic> salveCar(WorkModels objeto)  async {
    isLoading.value = true;
    var response = await workServices.salveCar(objeto);
    isLoading.value = false;
    update();
    return response;
  }

  Future<dynamic> deletecars (WorkModels objeto)  async {
    isLoading.value = true;
    var response = await workServices.removeCar(objeto);
    isLoading.value = false;
    update();
    return response;
  }
}

//that's right