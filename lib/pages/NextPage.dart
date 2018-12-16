import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:scoped_model/scoped_model.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class NextPage extends StatefulWidget {
  final Client clientModel;
  NextPage(this.clientModel);
  @override
  NextPageState createState() => new NextPageState(clientModel);
}

//States for the Initial Page
class NextPageState extends State<NextPage> {
  final Client clientModel;
  NextPageState(this.clientModel);
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);
//Controller to capture input from textField
  final textInput = new TextEditingController();

//When SUBMIT button is pressed, perform below event
  void _captureQuery() {
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold();
  }
}