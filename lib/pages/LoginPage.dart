import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class LoginPage extends StatefulWidget {
  Client clientModel;
  LoginPage(this.clientModel);
  @override
  LoginPageState createState() => new LoginPageState(clientModel);
}

//States for the Initial Page
class LoginPageState extends State<LoginPage> {
  Client clientModel;
  LoginPageState(this.clientModel);
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

  //Controller to capture user name and password from textFields
  final username = new TextEditingController();
  final password = new TextEditingController();

  //When SUBMIT button is pressed, perform below event
  void sendCredentials() {
    setState(() {
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      clientModel.validateLogin(context, username.text, password.text);
    });
  }

  void navigateRegisterPage() {
    setState(() {
      Navigator.of(context).pushNamed('/register');
    });
  }

  void automaticLogin() {
    setState(() {
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      clientModel.autoLogin(context);
    });
  }

  //TO DO Fix this later....
  void googleLogin() {
    setState(() {
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      //clientModel.getSymptoms(context);
    });
  }

  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Login Page',
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
                  '\r\n Welcome!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 2,
            ),
            //USER NAME ENTRY
            new Expanded(
              child:new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(2.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteCool),
                  border: Border.all(
                    color: const Color(AppColors.whiteWarm),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new Row(
                    children: <Widget>[
                      new Text(
                        'User:     ',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            //filled: true,
                            //fillColor: Color(AppColors.gray),
                            //border: InputBorder.none,
                            hintText: '   Enter your email here',
                          ),
                          controller: username,
                        ),
                      ),
                    ]
                ),
              ),
              flex: 1,
            ),
            //PASSWORD ENTRY
            new Expanded(
              child:new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(2.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteCool),
                  border: Border.all(
                    color: const Color(AppColors.whiteWarm),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: new Row(
                    children: <Widget>[
                      new Text(
                        'Pass:     ',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: appTheme.textTheme.caption,
                      ),
                      new Flexible(
                        child: new TextField(
                          textAlign: TextAlign.left,
                          style: appTheme.textTheme.caption,
                          decoration: InputDecoration(
                            //filled: true,
                            //fillColor: Color(AppColors.gray),
                            //border: InputBorder.none,
                            hintText: '   Enter your password here',
                          ),
                          controller: password,
                          obscureText: true,
                        ),
                      ),
                    ]
                ),
              ),
              flex: 1,
            ),
            //ERROR MESSAGE
            new Expanded(
              child:new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.only(left: 10.0, right:10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteCool),
                  border: Border.all(
                    color: const Color(AppColors.whiteWarm),
                    width: 0.5,
                  ),
                ),
                child: new Text(
                  clientModel.authMessage,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.display1,
                ),
              ),
              flex: 1,
            ),
            //BUTTON ROW
            new Expanded(
              child: new Row(
                children: <Widget>[
                  //LOG IN BUTTON
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: sendCredentials,
                          backgroundColor: Color(AppColors.redSaturated),
                          heroTag: 'button1',
                          child: new Icon(
                            FontAwesomeIcons.key
                          ),
                        ),
                        new Text(
                          'Log in',
                            style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  //REGISTER USER BUTTON
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: navigateRegisterPage,
                          backgroundColor: Color(AppColors.blueSaturated),
                          heroTag: 'button2',
                          child: new Icon(
                              FontAwesomeIcons.user
                          ),
                        ),
                        new Text(
                          'Register User',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  //AUTO LOGIN BUTTON
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: automaticLogin,
                          backgroundColor: Color(AppColors.blueSaturated),
                          heroTag: 'button3',
                          child: new Icon(
                              FontAwesomeIcons.forward
                          ),
                        ),
                        new Text(
                          'Auto Login',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex:1,
                  ),
                ],
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}