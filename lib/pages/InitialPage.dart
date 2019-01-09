import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: Color(AppColors.white),
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
                  color: Color(AppColors.white),
                  border: Border.all(
                      color: const Color(AppColors.white),
                      width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new Text(
                  '\r\n What is you issue today?',
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
                margin: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteWarm),
                  border: Border.all(
                    color: const Color(AppColors.blackCool),
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new TextField(
                  style: appTheme.textTheme.caption,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(AppColors.whiteWarm),
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
              child:new Row(
                children: <Widget>[
                  new Spacer(flex:4),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: captureQuery,
                          backgroundColor: Color(AppColors.blueSaturated),
                          heroTag: 'button1',
                          child: new Icon(
                              FontAwesomeIcons.search
                          ),
                        ),
                        new Text(
                          'Search',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex:1,
                  )
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}