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
          'Login Page',
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: new RawMaterialButton(
                  onPressed: googleLogin,
                  child: new Icon(
                    FontAwesomeIcons.googlePlusG,
                    color: Colors.red,

                  )
                  child: new Text(
                    'GOOGLE SIGN IN',
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

@override
Widget build(BuildContext context) {
  return new Scaffold(
      body: new Container(

child: new Column(
crossAxisAlignment: CrossAxisAlignment.center,
mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[

new Expanded(
child: new Row(
crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>

//GOOGLE SIGNIN BUTTON
new RawMaterialButton(
onPressed: () {
ScopedModel.of<BiteMeAppModel>(context)
    .signInWithGoogle(context);
},
child: new Icon(
FontAwesomeIcons.googlePlusG,
color: Colors.red,
size: 35.0,
),
shape: new CircleBorder(),
elevation: 2.0,
fillColor: Colors.white,
padding: const EdgeInsets.all(15.0),
),


  ---------------------------


  class AuthenticationModel extends CentralModel {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  //Instantiating model
  static BiteMeAppModel of(BuildContext context) =>
  ScopedModel.of<BiteMeAppModel>(context);

  //Listing out different displayable variables
  var user;
  var loggedIn = false;
  var method;
  var identity;
  var userEmail;
  var providerData;
  var userData;
  var userPicture;
  var authToken;

//Sign in via Google and fill in user informa
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
  currentUser = await _googleSignIn.signInSilently();
  }
  if (currentUser == null) {
  currentUser = await _googleSignIn.signIn();
  }
  print(authToken);
//Obtain FireBase tokens after signing in via Google Acc
  final GoogleSignInAuthentication auth = await currentUser.authentication;

  Future<Null> cacheData(
  user, loggedIn, identity, userEmail, userPicture, method) async {
  SharedPreferences authToken = await SharedPreferences.getInstance();
  this.authToken = authToken;
  authToken.setBool('loggedIn', loggedIn);
  authToken.setString('user', user.toString());
  authToken.setString('identity', identity);
  authToken.setString('userEmail', userEmail);
  authToken.setString('userPicture', userPicture);
  authToken.setString('method', method);
  notifyListeners();
  }


//If user wants to log out, check which service they logged in with and point to correct logout method
  Future<Null> logOut(BuildContext context) async {
  SharedPreferences authToken = await SharedPreferences.getInstance();
  print(this.method);
  if (this.method == 'google') {
  signOutWithGoogle(context);
  } else if (this.method == 'facebook') {
  logoutWithFacebook(context);
  } else {
  authToken.clear();
  ScopedModel.of<BiteMeAppModel>(context).checkAuth(context);
  print('logout error');
  }
  }

//Sign out with Google and empty all relevant objects
  Future<Null> signOutWithGoogle(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    this.loggedIn = false;
    authToken.clear();
    this.user = null;
    this.identity = null;
    this.userEmail = null;
    this.method = null;
    notifyListeners();
    ScopedModel.of<BiteMeAppModel>(context).checkAuth(context);
  }


  Future<bool> getLoginState() async {
  bool loginState = authToken.getBool('loggedIn');
  String user = authToken.getString('user');
  String method = authToken.getString('method');
  String userEmail = authToken.getString('userEmail');
  String userPicture = authToken.getString('userPicture');
  String identity = authToken.getString('identity');
  print(loginState);
  this.loggedIn = loginState;
  this.user = user;
  this.userEmail = userEmail;
  this.userPicture = userPicture;
  this.identity = identity;
  this.method= method;
  notifyListeners();
  });
  }
  }
