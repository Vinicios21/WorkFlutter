import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/Menu.dart';

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}

//that's right