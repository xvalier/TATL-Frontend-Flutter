import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/pages/InitialPage.dart';
import 'package:sets_frontend_flutter/pages/SymptomsPage.dart';
import 'package:sets_frontend_flutter/pages/NextPage.dart';
import 'package:sets_frontend_flutter/pages/ClosePage.dart';
import 'package:sets_frontend_flutter/pages/LoginPage.dart';
import 'package:sets_frontend_flutter/pages/RegisterPage.dart';

void main() => runApp(new App());
class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> {
  AppState();
  final Client clientModel = Client();
  @override
  Widget build(BuildContext context) {
    //ScopedModel allows a single object to be passed between all pages
    return ScopedModel<Client>(
      model: clientModel,
      //Definition of all routes between pages
      child: new MaterialApp(
        title: 'Xyntek Curated Troubleshooting',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/':         (context) => new LoginPage(clientModel),
          '/register': (context) => new RegisterPage(clientModel),
          '/initial':  (context) => new InitialPage(clientModel),
          '/symptoms': (context) => new SymptomsPage(clientModel),
          '/next':     (context) => new NextPage(clientModel),
          '/close':    (context) => new ClosePage(clientModel),
        },
      )
    );
  }
}

