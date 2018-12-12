///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';

import 'package:protobuf/protobuf.dart';

import 'sets.pb.dart';
import 'sets.pbjson.dart';

export 'sets.pb.dart';

abstract class ErrorResolutionServiceBase extends GeneratedService {
  Future<ServerList> getSymptomList(ServerContext ctx, UserQuery request);
  Future<ServerFeedback> startSession(ServerContext ctx, UserSelection request);
  Future<ServerFeedback> getNextQuestion(ServerContext ctx, UserFeedback request);

  GeneratedMessage createRequest(String method) {
    switch (method) {
      case 'getSymptomList': return new UserQuery();
      case 'startSession': return new UserSelection();
      case 'getNextQuestion': return new UserFeedback();
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  Future<GeneratedMessage> handleCall(ServerContext ctx, String method, GeneratedMessage request) {
    switch (method) {
      case 'getSymptomList': return this.getSymptomList(ctx, request);
      case 'startSession': return this.startSession(ctx, request);
      case 'getNextQuestion': return this.getNextQuestion(ctx, request);
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  Map<String, dynamic> get $json => ErrorResolution$json;
  Map<String, Map<String, dynamic>> get $messageJson => ErrorResolution$messageJson;
}

