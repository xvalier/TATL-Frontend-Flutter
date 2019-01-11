import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: new AppBar(
        title: new Text(
          'Xyntek Curated Troubleshooting',
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
                    '\r\n\r\n\r\n' + clientModel.closingMessage,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: appTheme.textTheme.headline,
                  ),
                ),
              flex: 5,
            ),
            //START OVER BUTTON
            new Expanded(
              child:new Row(
                children: <Widget>[
                  new Spacer(flex:4),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: startOver,
                          backgroundColor: Color(AppColors.blueSaturated),
                          heroTag: 'button1',
                          child: new Icon(
                              FontAwesomeIcons.redo
                          ),
                        ),
                        new Text(
                          'Start Over',
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