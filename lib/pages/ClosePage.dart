import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';

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
    setState(() { Navigator.of(context).pushNamed('/initial'); });
  }
  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  Header(title:'Xyntek Curated Troubleshooting',height:0),
      backgroundColor: Color(AppColors.white),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //QUESTION TEXT BOX
            new TextDisplay(
              message: '\r\n\r\n\r\n' + clientModel.closingMessage,
              margin: 5.0,
              color: AppColors.white,
              border: 5.0,
              flex: 5,
            ),
            //START OVER BUTTON
            new ButtonRow(
              widgets:[
                new Spacer(flex:4),
                new CustomButton(
                  function: startOver,
                  color: AppColors.blueSaturated,
                  tag: '1',
                  icon: FontAwesomeIcons.redo,
                  text: 'Start Over',
                  flex: 1,
                ),
              ],
              flex: 1,
            ),
          ]
        ),
      ),
    );
  }
}