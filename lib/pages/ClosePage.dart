import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class ClosePage extends StatefulWidget {
  final Client clientModel;
  ClosePage(this.clientModel);
  @override
  ClosePageState createState() => new ClosePageState(clientModel);
}

//States for the Initial Page
class ClosePageState extends State<ClosePage> {
  final Client clientModel;
  ClosePageState(this.clientModel);
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

//Controller to capture input from textField
  final textInput = new TextEditingController();

//When SUBMIT button is pressed, perform below event
  void _captureQuery() {
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold();}
}