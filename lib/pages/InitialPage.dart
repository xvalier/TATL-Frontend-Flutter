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
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

  //Controller to capture input from textField
  final textInput = new TextEditingController();

  //When SUBMIT button is pressed, perform below event
  void captureQuery() {
    setState(() {
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      clientModel.getSymptoms(context, textInput.text);
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
          children: <Widget>[
            new Text('What is you issue today?',),          //Message
            new RaisedButton(                               //Submit Button
              onPressed: captureQuery,
              color: Colors.green,
              child: new Text('SUBMIT'),
            ),
            new TextField(                                  //Text Input
              style: new TextStyle(
                height: 2.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
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