import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/theme.dart';

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
      backgroundColor: Color(AppColors.whiteCool),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //QUESTION TEXT BOX
            new Expanded(
              child:new Container(
                padding: EdgeInsets.all(2.0),
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
              flex: 5,
            ),
            //BUTTON ROW
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //YES BUTTON
                  new Expanded(
                    child: new Container(
                      constraints: BoxConstraints.expand(),
                      margin: const EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(AppColors.greenLight),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: new RaisedButton(
                        onPressed: captureYes,
                        color: Color(AppColors.greenLight),
                        child: new Text(
                          'YES',
                          style: appTheme.textTheme.button,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  //No BUTTON
                  new Expanded(
                    child: new Container(
                      constraints: BoxConstraints.expand(),
                      margin: const EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(AppColors.redLight),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: new RaisedButton(
                        onPressed: captureNo,
                        color: Color(AppColors.redLight),
                        child: new Text(
                          'NO',
                          style: appTheme.textTheme.button,
                        ),
                      ),
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