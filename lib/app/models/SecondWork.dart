import 'WorkModels.dart';

class Garagecars {

  final List<WorkModels> listParkingSpotModel;

  Garagecars(this.listParkingSpotModel);

  Garagecars.fromJson(List<dynamic> json):
        listParkingSpotModel = List.from(json).map((item) => WorkModels.fromJson(item)).toList() ;
}

//that's right