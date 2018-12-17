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
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);
  //Controller to capture input from textField
  final textInput = new TextEditingController();

  //When YES/NO button is pressed, perform below event
  void captureYes() {
    setState(() { clientModel.getQuestion(context, 1);});
  }
  void captureNo() {
    setState(() {clientModel.getQuestion(context, 0);});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Questions Page'),),
        body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(clientModel.nextQuestion,),         //Message
                new RaisedButton(                            //Yes Button
                  onPressed: captureYes,
                  color: Colors.green,
                  child: new Text('YES'),
                ),
                new RaisedButton(                            //No Button
                  onPressed: captureNo,
                  color: Colors.red,
                  child: new Text('NO'),
                ),
              ]
          ),
        )
    );
  }
}