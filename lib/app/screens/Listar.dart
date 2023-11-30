import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
import 'package:get/get.dart';
import '../controllers/WorkController.dart';
import 'Editar.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  var controller = WorkController.carGarage;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(context),
        drawer: Menu(context),
        body:
        Obx(() => controller.isLoading.value
            ?
        const Center(child: CircularProgressIndicator())
            :

        ListView.builder(
          itemCount: controller.carPhotos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.carPhotos[index].licensePlateCar),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editar(objeto: controller.carPhotos[index])
                        ),
                      );

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      var response = await controller.deletecars(controller.carPhotos[index]);
                      if(response !=false){
                        Get.snackbar("Sucesso", "Deletado com sucesso");
                        await controller.listParkingSpot();
                      }else{
                        Get.snackbar("Erro", "Erro ao deletar");
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),)
    );
  }
}

