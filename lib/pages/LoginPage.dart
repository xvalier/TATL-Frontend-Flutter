import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  //Google Sign In Variables
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  //When SUBMIT button is pressed, perform below event
  void checkLogin() {
    setState(() {
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      clientModel.sendAuth(context, username.text, password.text);
    });
  }

  void routeRegister() {
    setState(() {
      Navigator.of(context).pushNamed('/register');
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
                  'Welcome!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 2,
            ),
            //USER NAME ENTRY
            new Row(
              children: <Widget>[
                new Text(
                  'User:',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
                new TextField(
                  style: appTheme.textTheme.caption,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(AppColors.gray),
                    border: InputBorder.none,
                    hintText: 'Enter your email here',
                  ),
                  controller: username,
                ),
              ]
            ),
            //PASSWORD ENTRY
            new Row(
                children: <Widget>[
                  new Text(
                    'Password:',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: appTheme.textTheme.headline,
                  ),
                  new TextField(
                    style: appTheme.textTheme.caption,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(AppColors.gray),
                      border: InputBorder.none,
                      hintText: 'Enter your password here',
                    ),
                    controller: password,
                    obscureText: true,
                  ),
                ]
            ),
            //SUBMIT BUTTON
            new Container(
              constraints: BoxConstraints.expand(),
              margin: const EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(AppColors.bluePrimary),
                border: Border.all(
                  color: const Color(AppColors.blueSaturated),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new RaisedButton(
                onPressed: checkLogin,
                color: Color(AppColors.bluePrimary),
                child: new Text(
                  'SUBMIT',
                  style: appTheme.textTheme.button,
                ),
              ),
            ),
            //ERROR MESSAGE
            new Text(
              clientModel.authMessage,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: appTheme.textTheme.headline,
            ),
            //REGISTER MESSAGE
            new Text(
              'Are you a new user?...',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: appTheme.textTheme.headline,
            ),
            //REGISTER BUTTON
            new Container(
              constraints: BoxConstraints.expand(),
              margin: const EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(AppColors.bluePrimary),
                border: Border.all(
                  color: const Color(AppColors.blueSaturated),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new RaisedButton(
                onPressed: routeRegister,
                color: Color(AppColors.bluePrimary),
                child: new Text(
                'REGISTER',
                style: appTheme.textTheme.button,
                ),
              ),
            ),
            //GOOGLE SIGN IN BUTTON
            new Container(
              constraints: BoxConstraints.expand(),
              margin: const EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(AppColors.bluePrimary),
                border: Border.all(
                  color: const Color(AppColors.blueSaturated),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new RawMaterialButton(
                onPressed: googleLogin,
                child: new Icon(
                  FontAwesomeIcons.googlePlusG,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}