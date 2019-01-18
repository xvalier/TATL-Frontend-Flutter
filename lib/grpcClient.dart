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
    String loginErrorMessage = "";
    String registerErrorMessage = "";
    String nextQuestion;
    bool done;
    bool solved;
    String closingMessage;
    //Used to get Navigator to route to all pages based on 'context'
    static Client of(BuildContext context)=> ScopedModel.of<Client>(context);

    Future<Null> getStub() async {
        final channel = new ClientChannel(
            '10.0.2.2',//'104.196.188.181'
            port: 4040,
            options: const ChannelOptions(credentials: const ChannelCredentials.insecure()
            )
        );
        stub = new ErrorResolutionClient(channel);
        notifyListeners();
    }

    Future<Null> validateLogin(context, name, pass) async {
        print('Entered validateLogin function on frontend');
        //Encapsulate username and password and send to backend for auth
        final user = new User()..email=name..password=pass;
        print('Encapsulated User message');
        final receipt = await stub.sendLogin(user);
        print('Sent User message and received receipt');
        //Display message if error is not successful
        if (!receipt.successFlag) {
            print('Authentication not successful');
            loginErrorMessage = receipt.message;
            Navigator.of(context).pushNamed('/');
        }
        //Otherwise, route to initial page
        else {
            print('Authentication is successful, routing now');
            loginErrorMessage = '';
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/initial');
        }
        notifyListeners();
    }

    Future<Null> autoLogin(context) async {
        print('Entered autoLogin function on frontend');
        //Encapsulate username and password and send to backend for auth
        String did = await DeviceId.getID;
        print('Received device id:'+did);
        final user = new AutoUser()..devID=did;
        print('Encapsulated User message');
        final receipt = await stub.automaticLogin(user);
        print('Sent User message and received receipt');
        //Display message if error is not successful
        if (!receipt.successFlag) {
            print('Authentication not successful');
            loginErrorMessage = receipt.message;
            Navigator.of(context).pushNamed('/');
        }
        //Otherwise, route to initial page
        else {
            print('Authentication was successful, token is:'+receipt.token);
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/initial');
        }
        notifyListeners();
    }

    Future<Null> generateLogin(context, name, pass, org, role) async {
        print('Entered generateLogin function call');
        //Encapsulate username and password and send to backend for auth
        String did = await DeviceId.getID;
        print('Received device id:'+did);
        final newUser = new NewUser()
            ..email=name
            ..password=pass
            ..organization=org
            ..role=role
            ..devID=did;
        print('Created message');
        final receipt = await stub.createLogin(newUser);
        print('Send message to backend, got receipt');
        //Display message if error is not successful
        if (!receipt.successFlag) {
            print('Authentication was unsuccessful');
            registerErrorMessage = receipt.message;
            Navigator.of(context).pushNamed('/register');
        }
        //Otherwise, route to initial page
        else {
            print('Authentication is successful');
            userToken = receipt.token;
            Navigator.of(context).pushNamed('/initial');
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
        print('getQuestion function call');
        final userFeedback = new UserFeedback()..input = feedback;
        final question = await stub.getNextQuestion(userFeedback);
        print('Sent feedback');
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
      print(nextQuestion+'   ' + done.toString() + '   ' + solved.toString());
      notifyListeners();
    }

    //Setter for close Page message
    void setCloser(message){ closingMessage = message;}
}

class BaseModel extends Model{
    @override
    void notifyListeners() {super.notifyListeners();}
}

