import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class SymptomsPage extends StatefulWidget {
  final Client clientModel;
  SymptomsPage(this.clientModel);
  @override
  SymptomsPageState createState() => new SymptomsPageState(clientModel);
}

//States for the Initial Page
class SymptomsPageState extends State<SymptomsPage> {
  final Client clientModel;
  SymptomsPageState(this.clientModel);

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
