import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:scoped_model/scoped_model.dart';
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
  //Controller to capture input from textField
  final textInput = new TextEditingController();

  //When YES/NO button is pressed, perform below event
  void captureYes() {
    setState(() { clientModel.getQuestion(context, true);});
  }
  void captureNo() {
    setState(() {clientModel.getQuestion(context, false);});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Next Question Page',
          style: appTheme.textTheme.title,
        ),
      ),
      backgroundColor: Color(AppColors.white),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //QUESTION TEXT BOX
            new Expanded(
              child:new Container(
                padding: EdgeInsets.all(8.0),
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteWarm),
                  border: Border.all(
                    color: const Color(AppColors.blackCool),
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index){
                    return new Text(
                      clientModel.nextQuestion,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: appTheme.textTheme.body1,
                    );
                  }
                ),
              ),
              flex: 6,
            ),
            //BUTTON ROW
            new Expanded(
              child: new Row(
                children: <Widget>[
                  //Yes BUTTON
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: captureYes,
                          backgroundColor: Color(AppColors.greenLight),
                          heroTag: 'button1',
                          child: new Icon(
                              FontAwesomeIcons.check
                          ),
                        ),
                        new Text(
                          'Yes',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  //No BUTTON
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: captureNo,
                          backgroundColor: Color(AppColors.redLight),
                          heroTag: 'button2',
                          child: new Icon(
                              FontAwesomeIcons.times
                          ),
                        ),
                        new Text(
                          'No',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
          ]
        ),
      )
    );
  }
}