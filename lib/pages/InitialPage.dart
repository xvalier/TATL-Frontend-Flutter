import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';

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
      appBar: new AppBar(
        title: new Text(
          'Initial Page',
          style: appTheme.textTheme.title,
        ),
      ),
      backgroundColor: Color(AppColors.whiteCool),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //QUESTION TEXT BOX
            new Expanded(
              child:new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteCool),
                  border: Border.all(
                      color: const Color(AppColors.whiteWarm),
                      width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new Text(
                  'What is you issue today?',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 2,
            ),
            //QUERY TEXT INPUT FIELD
            new Expanded(
              child: new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.gray),
                  border: Border.all(
                    color: const Color(AppColors.gray),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new TextField(
                  style: appTheme.textTheme.caption,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(AppColors.gray),
                    border: InputBorder.none,
                    hintText: 'Enter your issue here...',
                  ),
                  controller: textInput,
                ),
              ),
              flex: 3,
            ),
            //SUBMIT BUTTON
            new Expanded(
              child: new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.bluePrimary),
                  border: Border.all(
                    color: const Color(AppColors.blueSaturated),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new RaisedButton(
                  onPressed: captureQuery,
                  color: Color(AppColors.bluePrimary),
                  child: new Text(
                    'SUBMIT',
                    style: appTheme.textTheme.button,
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}