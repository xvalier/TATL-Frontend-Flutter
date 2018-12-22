import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';

//Initial Page (Home) Widget. Contains state config for fields that affect appearence
class SymptomsPage extends StatefulWidget {
  final Client clientModel;
  SymptomsPage(this.clientModel);
  @override
  SymptomsPageState createState() => new SymptomsPageState(clientModel);
}

//States for the Initial Page
class SymptomsPageState extends State<SymptomsPage> {
  final Client clientModel;
  SymptomsPageState(this.clientModel);
  //Used to get Navigator to route to all pages based on 'context'
  static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

  //Controller to capture input from textField
  List<bool> checkboxes = [false,false,false,false,false];

  //When SUBMIT button is pressed, perform below event
  void captureSelection() {
    setState(() {
      //Convert list of user choices to string of 1s and 0s
      String selection ='';
      for (var i=0; i<5;i++){
        selection = selection + bool2str(i, checkboxes[i]);
      }
      print(selection);
      clientModel.getFirstQuestion(context, selection);
    });
  }
  
  //Function to convert bools to appropiate string representation
  String bool2str(int i, bool value){
    if(value){ return i.toString();}
    else{return '';}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Symptoms Page'),),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Does any of the below symptoms match?',), //Message
            new RaisedButton(                                   //Submit Button
              onPressed: captureSelection,
              color: Colors.green,
              child: new Text('SUBMIT'),
            ),
            Expanded(
              child: ListView.builder(                          //CheckList
                  itemCount: clientModel.symptoms.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text('${clientModel.symptoms[index]}'),
                      value: checkboxes[index],
                      onChanged: (bool value){
                        setState((){
                          checkboxes[index]=value;
                        });
                      },
                    );
                  },
              ),
            )
          ]
        ),
      )
    );
  }
}
