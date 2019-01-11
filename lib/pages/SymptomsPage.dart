import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  'Does any of the below symptoms match?',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: appTheme.textTheme.headline,
                ),
              ),
              flex: 3,
            ),
            //LIST OF SYMPTOMS
            new Expanded(
              child: new Container(
                constraints: BoxConstraints.expand(),
                margin: const EdgeInsets.all(6.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(AppColors.whiteWarm),
                  border: Border.all(
                    color: const Color(AppColors.blackCool),
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                child: new Scrollbar(
                  child: new ListView.builder(
                    itemCount: clientModel.symptoms.length,
                    //Make Scroll Visible
                    //Divide each list item
                    itemBuilder: (context, index){
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(AppColors.white),
                          border: Border.all(
                            color: const Color(AppColors.blackCool),
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            '${clientModel.symptoms[index]}',
                            style: appTheme.textTheme.body2,
                          ),
                          value: checkboxes[index],
                          onChanged: (bool value){
                            setState((){
                              checkboxes[index]=value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              flex: 7,
            ),
            //SUBMIT BUTTON
            new Expanded(
              child:new Row(
                children: <Widget>[
                  new Spacer(flex:4),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new FloatingActionButton(
                          onPressed: captureSelection,
                          backgroundColor: Color(AppColors.blueSaturated),
                          heroTag: 'button1',
                          child: new Icon(
                              FontAwesomeIcons.clipboardCheck
                          ),
                        ),
                        new Text(
                          'Submit',
                          style: appTheme.textTheme.display3,
                        ),
                      ],
                    ),
                    flex:1,
                  )
                ],
              ),
              flex: 2,
            ),
          ]
        ),
      )
    );
  }
}
