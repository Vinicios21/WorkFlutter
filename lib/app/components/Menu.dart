import 'package:flutter/material.dart';
import '../screens/Criar.dart';
import '../screens/Home.dart';
import '../screens/Listar.dart';


Widget Menu(BuildContext context){
  return Drawer(
      child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Conexão API"),
              accountEmail: Text("Trabalho final"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvv9vIUUAAMYiC5rY-EwbbpfIbwk77_JCz1g&usqp=CAU',
                ),
                // Text(
                //   "Estacionamento",
                //   style: TextStyle(fontSize: 40.0),
                // ),
              ),
            ),
            ListTile(
              title: Text("Menu"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text("Listar Veiculos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaPage()),
                );
              },
            ),
            ListTile(
              title: Text("Cadastrar Veiculos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Criar()),
                );
              },
            ),
          ]
      )
  );
}
