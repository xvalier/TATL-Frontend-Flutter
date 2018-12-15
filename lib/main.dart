import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/proto/sets.pb.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pbserver.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Xyntek Curated Troubleshooting',
      theme: new ThemeData(primarySwatch: Colors.blue,),
      home: new InitialPage(title: 'Initial Page'),
    );
  }
}

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InitialPageState createState() => new _InitialPageState();
}

//States for the Initial Page
class _InitialPageState extends State<InitialPage> {
  //Controller to capture input from textField
  final textInput = new TextEditingController();

  //When SUBMIT button is pressed, perform below event
  void _captureQuery() async {
    setState(() {
      //Initialize gRPC channel
      final stub = getStub();
      //Grab description from textField and encapsulate as UserQuery gRPC message
      final userQuery = new UserQuery()..input=textInput.text;
      final symList  = stub.getSymptomList(userQuery);
      final symptoms = <ServerList>[symList];

      ${symList.symptoms
      if (symptoms == NULL){
        symptoms ==NULL
      }

      //Move to Symptoms Page if symptoms list has items
      //Else, go to close page
    });
  }

  //Method that is re-run every time setState is called.
  //This portion controls appearance. It is equivalent to XML layout in Android
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title),),
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
              onPressed: _captureQuery,
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
              controller: userInput,
            ),
          ],
        ),
      ),
    );
  }
}
