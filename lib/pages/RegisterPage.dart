import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class RegisterPage extends StatefulWidget {
  Client clientModel;
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
      clientModel.generateLogin(context, username, password, organization, role);
    });
  }

  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Register Page',
          style: appTheme.textTheme.title,
        ),
      ),
      backgroundColor: Color(AppColors.whiteCool),
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
                  'Please tell us who you are!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 3,
            ),
            //FILL IN FORM
            new Expanded(
              child: new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteCool),
                  border: Border.all(
                    color: const Color(AppColors.whiteWarm),
                    width: 0.5,
                  ),
                ),
                child: new Column(
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
                          'Org:     ',
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
                    new Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        clientModel.authMessage,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: appTheme.textTheme.display1,
                      ),
                    ),
                  ],
                ),
              ),
              flex: 4,
            ),

          ],
        ),
      ),
    );
  }
}
