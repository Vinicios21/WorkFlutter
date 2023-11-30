import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
import '../controllers/WorkController.dart';
import '../models/WorkModels.dart';


class Editar extends StatefulWidget {
  Editar({Key? key, required this.objeto}) : super(key: key);

  final WorkModels objeto;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<Editar> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final _parkingSpotNumberController = TextEditingController();
    final _licensePlateCarController = TextEditingController();
    final _brandCarController = TextEditingController();
    final _modelCarController = TextEditingController();
    final _colorCarController = TextEditingController();
    final _responsibleNameController = TextEditingController();
    final _apartamentController = TextEditingController();
    final _blockController = TextEditingController();

    _parkingSpotNumberController.text = widget.objeto.parkingSpotNumber;
    _licensePlateCarController.text = widget.objeto.licensePlateCar;
    _brandCarController.text = widget.objeto.brandCar;
    _modelCarController.text = widget.objeto.modelCar;
    _colorCarController.text = widget.objeto.colorCar;
    _responsibleNameController.text = widget.objeto.responsibleName;
    _apartamentController.text = widget.objeto.apartment;
    _blockController.text = widget.objeto.block;

    var controller = WorkController.carGarage;

    // Create TextFormField validators
    String? validateFormField(String value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    // Create a handle to submit the form
    void handleSubmit() async {
      WorkModels parkingSpot = WorkModels(
          widget.objeto.id,
          _parkingSpotNumberController.text,
          _licensePlateCarController.text,
          _brandCarController.text,
          _modelCarController.text,
          _colorCarController.text,
          "",
          _responsibleNameController.text,
          _apartamentController.text,
          _blockController.text
      );

      var response =  await controller.editCar(parkingSpot);

      if(response != false){

        Get.snackbar(
          "Sucesso",
          "Salvo com Sucesso",
          icon: Icon(Icons.check, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,

        );

      }else{
        Get.snackbar(
            "Houve um erro",
            response,
            icon: Icon(Icons.error, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            //   borderColor: Colors.blue
            colorText: Colors.white
        );
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Menu(context),
      body:SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Número da Vaga',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _parkingSpotNumberController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Placa Carro',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _licensePlateCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Marca do Carro',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _brandCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Modelo do Carro',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _modelCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cor do Carro',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _colorCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Responsável',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _responsibleNameController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Apartamento',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _apartamentController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Bloco',
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _blockController,
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      child: Text('Enviar'),
                      onPressed: handleSubmit,
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}

//that's right