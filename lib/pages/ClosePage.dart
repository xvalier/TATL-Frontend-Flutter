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
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

  //When START OVER button is pressed, go back to Initial page
  void startOver() {
    setState(() { Navigator.of(context).pushNamed('/'); });
  }

  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Closing Page'),),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Vertical Linear Layout of Views
          children: <Widget>[
            new Text(clientModel.closingMessage),       //Closing Message
            new RaisedButton(                           //START OVER Button
              onPressed: startOver,
              color: Colors.green,
              child: new Text('START OVER'),
            ),
          ],
        ),
      ),
    );
  }
}