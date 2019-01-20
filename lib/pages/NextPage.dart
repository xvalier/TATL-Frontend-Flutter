import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Next Page (Home) Widget. Contains state config for fields that affect appearence
class NextPage extends StatefulWidget {
  final Client clientModel;
  NextPage(this.clientModel);
  @override
  NextPageState createState() => new NextPageState(clientModel);
}

//States for the Next Page
class NextPageState extends State<NextPage> {
  final Client clientModel;
  NextPageState(this.clientModel);
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);
  //Variable for Text widget
  String question = "";

  void initState(){
    super.initState();
    question = clientModel.nextQuestion;
  }

  //When YES/NO button is pressed, perform below event
  void captureYes() {
    print('captured a yes');
    clientModel.getQuestion(context, true).then((_) {
      print('Back on next page');
      setState(() { question = clientModel.nextQuestion; });
    });
  }
  void captureNo() {
    print('captured a no');
    clientModel.getQuestion(context, false).then((_) {
      print('Back on next page');
      setState(() { question = clientModel.nextQuestion; });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  Header(message:'Xyntek Curated Troubleshooting'),
      backgroundColor: Color(AppColors.white),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //QUESTION TEXT BOX
            NextPageDisplay(
              message: question,
              pad:    8.0,
              border: 8.0,
              color:  AppColors.whiteWarm,
              borderColor: AppColors.blackCool,
              flex: 6,
            ),
            //BUTTON ROW
            ButtonRow(
              widgets:[
                //YES BUTTON
                CustomButton(
                  function: captureYes,
                  color: AppColors.greenLight,
                  tag: '1',
                  icon: FontAwesomeIcons.check,
                  text: 'Yes',
                  flex: 1,
                ),
                //NO BUTTON
                CustomButton(
                  function: captureNo,
                  color: AppColors.redLight,
                  tag: '2',
                  icon: FontAwesomeIcons.times,
                  text: 'Yes',
                  flex: 1,
                ),
              ],
              flex: 1,
            ),
          ]
        ),
      )
    );
  }
}