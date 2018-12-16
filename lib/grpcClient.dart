import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';

class Client {
    ErrorResolutionClient stub;
    List<String> symptoms;
    String nextQuestion;
    bool done;
    bool solved;

    Future<Null> getStub() async {
        final channel = new ClientChannel(
            '104.196.188.181',
            port: 4040,
            options: const ChannelOptions(credentials: const ChannelCredentials.insecure()
            )
        );
        stub = new ErrorResolutionClient(channel);
    }

    //Process user description to get list of relevant symptoms
    Future<Null> getSymptoms(text) async {
        final userQuery = new UserQuery()..input = text;
        final symList = await stub.getSymptomList(userQuery);
        for (var item in symList.symptoms) {
            symptoms.add(item.input);
        }
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
    }
}