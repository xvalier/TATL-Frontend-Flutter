import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:device_id/device_id.dart';

class Client extends BaseModel {
    ErrorResolutionClient stub;
    List<String> symptoms = [];
    String userToken   = "";
    String authMessage = "Need to register user before autologin";
    String nextQuestion;
    bool done;
    bool solved;
    String closingMessage;
    //Used to get Navigator to route to all pages based on 'context'
    static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

    Future<Null> getStub() async {
        final channel = new ClientChannel(
            '104.196.188.181',
            port: 4040,
            options: const ChannelOptions(credentials: const ChannelCredentials.insecure()
            )
        );
        stub = new ErrorResolutionClient(channel);
        notifyListeners();
    }

    Future<Null> validateLogin(context, name, pass) async {
        //Encapsulate username and password and send to backend for auth
        String did = await DeviceId.getID;
        final user = new User()..email=name..pass=pass..devID=did;
        final receipt = await stub.sendLogin(user);
        //Display message if error is not successful
        if (!receipt.successFlag) {
            authMessage = receipt.message;
        }
        //Otherwise, route to initial page
        else {
            authMessage = '';
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/initial');
        }
        notifyListeners();
    }

    Future<Null> autoLogin(context) async {
        //Encapsulate username and password and send to backend for auth
        String did = await DeviceId.getID;
        final user = new User()..devID=did;
        final receipt = await stub.sendLogin(user);
        //Display message if error is not successful
        if (!receipt.successFlag) {
            authMessage = receipt.message;
        }
        //Otherwise, route to initial page
        else {
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/initial');
        }
        notifyListeners();
    }

    Future<Null> generateLogin(context, name, pass, org, role) async {
        //Encapsulate username and password and send to backend for auth
        String did = await DeviceId.getID;
        final newUser = new NewUser()
            ..email=name
            ..pass=pass
            ..organization=org
            ..role=role
            ..devID=did;
        final receipt = await stub.createLogin(newUser);
        //Display message if error is not successful
        if (!receipt.successFlag) { authMessage = receipt.message; }
        //Otherwise, route to initial page
        else {
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/');
        }
        notifyListeners();
    }



    Future<Null> getSymptoms(context, text) async {
        //Process user description to get list of relevant symptoms
        final userQuery = new UserQuery()..input = text;
        final symList = await stub.getSymptomList(userQuery);
        //Fill symptoms list with backend symptoms
        symptoms = [];
        if(symList.symptoms.isNotEmpty) {
            for (var item in symList.symptoms) {
                symptoms.add(item.input);
            }
        }
        //If no symptoms, go to close page. Otherwise, go to Symptoms page
        if (symptoms.isEmpty){
            setCloser('No symptoms were found for description');
            Navigator.of(context).pushNamed('/close');
        }
        else{ Navigator.of(context).pushNamed('/symptoms'); }
        notifyListeners();
    }

    //Take in user selected symptoms to get first question to ask
    Future<Null> getFirstQuestion(context, selection) async {
        final userSelection = UserSelection()..input=selection;
        final question = await stub.startSession(userSelection);
        processQuestion(question);
        if(done){
            setCloser('No symptoms/resolutions match your choices.');
            Navigator.of(context).pushNamed('/close');
        }
        else{ Navigator.of(context).pushNamed('/next'); }
    }

    //Take in user yes/no answer to get next question to ask
    Future<Null> getQuestion(context, feedback) async {
        final userFeedback = new UserFeedback()..input = feedback;
        final question = await stub.getNextQuestion(userFeedback);
        processQuestion(question);
        if(done){
            if(solved){ setCloser('Problem is solved!'); }
            else{ setCloser('No records match your issue');}
            Navigator.of(context).pushNamed('/close');
        }
    }

    //Extract attribute information from gRPC message
    void processQuestion(question){
      nextQuestion = question.input;
      done = question.doneFlag;
      solved = question.solvedFlag;
      notifyListeners();
    }

    //Setter for close Page message
    void setCloser(message){ closingMessage = message;}
}

class BaseModel extends Model{
    @override
    void notifyListeners() {super.notifyListeners();}
}

