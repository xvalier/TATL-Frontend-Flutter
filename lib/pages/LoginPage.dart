import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class LoginPage extends StatefulWidget {
  final Client clientModel;
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
      username.clear();
      password.clear();
    });
  }

  void navigateRegisterPage() {
    setState(() {
      print('Navigating to Register Page');
      clientModel.loginErrorMessage = "";
      clientModel.registerErrorMessage = "";
      Navigator.of(context).pushNamed('/register');
    });
  }

  void automaticLogin() {
    setState(() {
      print('Performing automatic login');
      //Process user description to get symptoms, move to symptoms/close page
      clientModel.getStub();
      clientModel.autoLogin(context);
    });
  }

  //GUI Layout
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( 'Xyntek Curated Troubleshooting',
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
            TextDisplay(
              message: '\r\n Welcome!',
              margin: 5.0,
              color: AppColors.white,
              border: 5.0,
              flex: 4,
            ),
            //FILL IN FORM
            FullForm(
              rows: [
                //USER NAME ENTRY
                FormRow(
                  label: 'User:   ',
                  hint: '   Enter your email here',
                  controller: username,
                  mask: false,
                ),
                //PASSWORD ENTRY
                FormRow(
                  label: 'Pass:   ',
                  hint: '   Enter your password here',
                  controller: password,
                  mask: true,
                ),
                //ERROR MESSAGE
                ErrorMessage(message:clientModel.loginErrorMessage),
              ],
              flex: 7,
            ),
            //BUTTON ROW
            ButtonRow(
              widgets:[
                //LOGIN BUTTON
                CustomButton(
                  function: sendCredentials,
                  color: AppColors.redSaturated,
                  tag: '1',
                  icon: FontAwesomeIcons.key,
                  text: 'Log In',
                  flex: 1,
                ),
                //REGISTER BUTTON
                CustomButton(
                  function: navigateRegisterPage,
                  color: AppColors.blueSaturated,
                  tag: '2',
                  icon: FontAwesomeIcons.user,
                  text: 'Register User',
                  flex: 1,
                ),
                //AUTLOGIN BUTTON
                CustomButton(
                  function: automaticLogin,
                  color: AppColors.blueSaturated,
                  tag: '3',
                  icon: FontAwesomeIcons.forward,
                  text: 'Auto Login',
                  flex: 1,
                ),
              ],
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}