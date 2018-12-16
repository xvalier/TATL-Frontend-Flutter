import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class InitialPage extends StatefulWidget {
  Client clientModel;
  InitialPage(this.clientModel);
  @override
  InitialPageState createState() => new InitialPageState(clientModel);
}

//States for the Initial Page
class InitialPageState extends State<InitialPage> {
  Client clientModel;
  InitialPageState(this.clientModel);

  //Controller to capture input from textField
  final textInput = new TextEditingController();

  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

  //When SUBMIT button is pressed, perform below event
  void captureQuery() {
    setState(() {
      //Process user description, obtain list of relevant symptoms
      clientModel.getStub();
      clientModel.getSymptoms(context, textInput.text);
      print('Back to initial page');
    });
  }

  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Initial Page'),),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Vertical Linear Layout of Views
          children: <Widget>[
            //TextView Equivalent
            new Text(
              'What is you issue today?',
            ),
            //Submit Button
            new RaisedButton(
              onPressed: captureQuery,
              color: Colors.green,
              child: new Text('SUBMIT'),
            ),
            //TextInput Equivalent
            new TextField(
              style: new TextStyle(
                height: 2.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                //textwrap
                //fill up screen
                border: InputBorder.none,
                hintText: 'Enter your issue here',
              ),
              controller: textInput,
            ),
          ],
        ),
      ),
    );
  }
}