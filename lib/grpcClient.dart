import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:sets_frontend_flutter/proto/sets.pbgrpc.dart';
import 'package:scoped_model/scoped_model.dart';


class BaseModel extends Model {
    @override
    void notifyListeners(){
        super.notifyListeners();
    }
}

class GeneralModel extends Model with BaseModel, CommModel {}

class CommModel extends BaseModel{
    var stub;

    static GeneralModel of(context) =>ScopedModel.of<GeneralModel>(context);

    Future<ErrorResolutionClient> getStub() async {
        final channel = new ClientChannel(
            '104.196.188.181',
            port:4040,
            options: const ChannelOptions(
                credentials: const ChannelCredentials.insecure()
            )
        );
        final stub = ErrorResolutionClient(channel);
        this.stub = stub;
        notifyListeners();
    }

}

var a =  new CommModel();
var b = a.getStub();
var c = a.





