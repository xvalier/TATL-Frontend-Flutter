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
  void captureSelection() {
    print('Reached symptoms page...');
    setState() {}
  }

  @override @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Symptoms Page'),),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Vertical Linear Layout of Views
          children: <Widget>[
            //TextView Equivalent
            new Text(
              'Does any of the below symptoms match?',
            ),
            //Submit Button
            new RaisedButton(
              onPressed: captureSelection,
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
