import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class InitialPage extends StatefulWidget {
  final Client clientModel;
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
      appBar: new AppBar(
        title: new Text( 'Xyntek Curated Troubleshooting',
          style: appTheme.textTheme.title,
        ),
      ),
      backgroundColor: Color(AppColors.white),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //QUESTION TEXT BOX
            TextDisplay(
              message: '\r\n What is your issue?',
              margin: 2.0,
              color: AppColors.white,
              border: 5.0,
              flex: 2,
            ),
            //QUERY TEXT INPUT FIELD
            QuestionInput(
              margin: 10.0,
              border: 5.0,
              color: AppColors.whiteWarm,
              borderColor: AppColors.blackCool,
              hint: 'Enter your issue here...',
              controller: textInput,
              flex: 3,
            ),
            //SUBMIT BUTTON
            ButtonRow(
              widgets:[
                new Spacer(flex:4),
                new CustomButton(
                  function: captureQuery,
                  color: AppColors.blueSaturated,
                  tag: '1',
                  icon: FontAwesomeIcons.search,
                  text: 'Search',
                  flex: 1,
                ),
              ],
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}