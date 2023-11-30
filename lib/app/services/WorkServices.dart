import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/SecondWork.dart';
import '../models/WorkModels.dart';

class WorkServices {

  String listar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/list";
  String editar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit";
  String deletar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/delete";
  String salvar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save";

  dynamic _response;
  ParkingSpotService(){
    _response="";
  }

  Future<Garagecars> listCar() async {
    _response = await http.get(Uri.parse(listar));
    if (_response.statusCode == 200) {
      List<dynamic> list = json.decode(_response.body);
      return Garagecars.fromJson(list);
    } else {
      throw Exception('Failed to load cote');
    }
  }

  Future<dynamic> editCar(WorkModels objeto) async {
    _response = await http.post(Uri.parse(editar),body: json.encode(objeto.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      return false;
    }
  }

  Future<dynamic> removeCar(WorkModels objeto) async {
    _response = await http.post(Uri.parse(deletar+"/"+objeto.id.toString()));
    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> salveCar(WorkModels garage) async {
    _response = await http.post(Uri.parse(salvar),body: json.encode(garage.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return WorkModels.fromJson(retorno) ;
    } else {
      return false;
    }
  }
}

//that's right