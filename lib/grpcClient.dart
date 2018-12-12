import 'dart:async';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pb.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';

Future<ErrorResolutionClient> getStub() async{
    final channel = new ClientChannel('104.196.188.181',
        port:4040,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()
        ));
    final stub = new ErrorResolutionClient(channel);
    return stub;
}

F