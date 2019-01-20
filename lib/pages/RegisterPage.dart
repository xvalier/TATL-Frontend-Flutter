import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';

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
              message: '\r\nCreate an ID',
              margin: 0.0,
              color: AppColors.white,
              border: 5.0,
              flex: 5,
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
                //ORGANIZATION ENTRY
                FormRow(
                  label: 'Org:    ',
                  hint: '   Where do you work',
                  controller: organization,
                  mask: false,
                ),
                //ROLE ENTRY
                FormRow(
                  label: 'Role:   ',
                  hint: '   What is your expertise',
                  controller: role,
                  mask: false,
                ),
                //ERROR MESSAGE
                ErrorMessage(message:clientModel.registerErrorMessage),
              ],
              flex: 7,
            ),
            //REGISTER BUTTON
            ButtonRow(
              widgets:[
                CustomButton(
                  function: createCredentials,
                  color: AppColors.blueSaturated,
                  tag: '1',
                  icon: FontAwesomeIcons.user,
                  text: 'Create New User',
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
