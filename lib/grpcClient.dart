import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';
import 'package:scoped_model/scoped_model.dart';

class Client extends baseModel {
    ErrorResolutionClient stub;
    List<String> symptoms = [];
    String nextQuestion;
    bool done;
    bool solved;
    String closingMessage;
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

    //Process user description to get list of relevant symptoms
    Future<Null> getSymptoms(context, text) async {
        final userQuery = new UserQuery()..input = text;
        final symList = await stub.getSymptomList(userQuery);
        if(symList.symptoms.isNotEmpty) {
            for (var item in symList.symptoms) {
                symptoms.add(item.input);
                print(item.input);
            }
        }
        //If no symptoms, go to close page. Otherwise, go to Symptoms page
        if (symptoms.isEmpty){
            print('Symptoms list is empty, must close out');
            setCloser('No symptoms were found for description');
            Navigator.of(context).pushNamed('/close');
        }
        else{
            print('Navigating to symptoms page');
            Navigator.of(context).pushNamed('/symptoms');
        }
        notifyListeners();
    }

    //Take in user selected symptoms to get first question to ask
    Future<Null> getFirstQuestion(selection) async {
        final userSelection  = UserSelection()..input=selection;
        final question = await stub.startSession(userSelection);
        processQuestion(question);
    }

    //Take in user yes/no answer to get next question to ask
    Future<Null> getQuestion(feedback) async {
        final userFeedback = new UserFeedback()..input = feedback;
        final question = await stub.getNextQuestion(userFeedback);
        processQuestion(question);
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

class baseModel extends Model{
    @override
    void notifyListeners() {super.notifyListeners();}
}

