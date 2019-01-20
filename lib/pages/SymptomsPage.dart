import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:sets_frontend_flutter/pages/GUIElements.dart';
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
        title: new Text( 'Xyntek Curated Troubleshooting',
          style: appTheme.textTheme.title,
        ),
      ),
      backgroundColor: Color(AppColors.white),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //QUESTION TEXT BOX
            TextDisplay(
              message: 'Does any of the below symptoms match?',
              margin: 5.0,
              color: AppColors.white,
              border: 5.0,
              flex: 3,
            ),
            //LIST OF SYMPTOMS
            SymptomsList(
              margin: 6.0,
              border: 2.0,
              color: AppColors.whiteWarm,
              borderColor: AppColors.blackCool,
              flex: 7,
              item: new ListView.builder(
                itemCount: clientModel.symptoms.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(AppColors.white),
                      border: Border.all(
                        color: Color(AppColors.blackCool),
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
                      onChanged: (bool value) {
                        setState(() { checkboxes[index]=value; });
                      }
                    ),
                  );
                }
              ),
            ),
            //SUBMIT BUTTON
            ButtonRow(
              widgets:[
                new Spacer(flex:4),
                new CustomButton(
                  function: captureSelection,
                  color: AppColors.blueSaturated,
                  tag: '1',
                  icon: FontAwesomeIcons.clipboardCheck,
                  text: 'Submit',
                  flex: 1,
                ),
              ],
              flex: 2,
            ),
          ]
        ),
      )
    );
  }
}