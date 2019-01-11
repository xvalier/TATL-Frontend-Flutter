import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class RegisterPage extends StatefulWidget {
  final Client clientModel;
  RegisterPage(this.clientModel);
  @override
  RegisterPageState createState() => new RegisterPageState(clientModel);
}

//States for the Initial Page
class RegisterPageState extends State<RegisterPage> {
  Client clientModel;
  RegisterPageState(this.clientModel);
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context) => ScopedModel.of<Client>(context);

  //Controller to capture user name and password from textFields
  final username = new TextEditingController();
  final password = new TextEditingController();
  final organization = new TextEditingController();
  final role = new TextEditingController();

  //When SUBMIT button is pressed, perform below event
  void createCredentials() {
    setState(() {
      //Send new user information to backend and log in simulataneously
      clientModel.getStub();
      clientModel.generateLogin(context, username.text, password.text, organization.text, role.text);
      password.clear();
    });
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Welcome TEXT BOX
            new Expanded(
              child: new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(0.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.white),
                  border: Border.all(
                    color: const Color(AppColors.white),
                    width: 5.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new Text(
                  '\r\nCreate an ID',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 5,
            ),
            //FILL IN FORM
            new Expanded(
              child: new ListView(
                padding: const EdgeInsets.only(top: 5.0,left:15.0, right:15.0),
                children: <Widget>[
                  //USER NAME/EMAIL ENTRY
                  new Row(
                    children: <Widget>[
                      new Text(
                        'User:     ',
                        textAlign: TextAlign.left,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            hintText: '   Enter your email here',
                          ),
                          controller: username,
                        ),
                      ),
                    ],
                  ),
                  //PASSWORD ENTRY
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Pass:     ',
                        textAlign: TextAlign.left,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            hintText: '   Enter your password here',
                          ),
                          controller: password,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  //ORG ENTRY
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Org:      ',
                        textAlign: TextAlign.left,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            hintText: '   Where do you work',
                          ),
                          controller: organization,
                        ),
                      ),
                    ],
                  ),
                  //ROLE ENTRY
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Role:     ',
                        textAlign: TextAlign.left,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            hintText: '   What is your expertise',
                          ),
                          controller: role,
                        ),
                      ),
                    ],
                  ),
                  //ERROR MESSAGE
                  new Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: new Text(
                      clientModel.registerErrorMessage,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: appTheme.textTheme.display1,
                    ),
                  ),
                ],
              ),
              flex: 7,
            ),
            //REGISTER USER BUTTON
            new Expanded(
              child: new ListView(
                children: <Widget>[
                  new FloatingActionButton(
                    onPressed: createCredentials,
                    backgroundColor: Color(AppColors.blueSaturated),
                    heroTag: 'button2',
                    child: new Icon(
                        FontAwesomeIcons.user
                    ),
                  ),
                  new Text(
                    'Create New User',
                    textAlign: TextAlign.center,
                    style: appTheme.textTheme.display3,
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
