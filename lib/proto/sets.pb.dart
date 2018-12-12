///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';
// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class UserQuery extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UserQuery')
    ..aQS(1, 'input')
  ;

  UserQuery() : super();
  UserQuery.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserQuery.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserQuery clone() => new UserQuery()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static UserQuery create() => new UserQuery();
  static PbList<UserQuery> createRepeated() => new PbList<UserQuery>();
  static UserQuery getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUserQuery();
    return _defaultInstance;
  }
  static UserQuery _defaultInstance;
  static void $checkItem(UserQuery v) {
    if (v is! UserQuery) checkItemFailed(v, 'UserQuery');
  }

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class _ReadonlyUserQuery extends UserQuery with ReadonlyMessageMixin {}

class Symptom extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Symptom')
    ..aQS(1, 'input')
  ;

  Symptom() : super();
  Symptom.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Symptom.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Symptom clone() => new Symptom()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Symptom create() => new Symptom();
  static PbList<Symptom> createRepeated() => new PbList<Symptom>();
  static Symptom getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySymptom();
    return _defaultInstance;
  }
  static Symptom _defaultInstance;
  static void $checkItem(Symptom v) {
    if (v is! Symptom) checkItemFailed(v, 'Symptom');
  }

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class _ReadonlySymptom extends Symptom with ReadonlyMessageMixin {}

class ServerList extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ServerList')
    ..pp<Symptom>(1, 'symptoms', PbFieldType.PM, Symptom.$checkItem, Symptom.create)
  ;

  ServerList() : super();
  ServerList.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ServerList.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ServerList clone() => new ServerList()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ServerList create() => new ServerList();
  static PbList<ServerList> createRepeated() => new PbList<ServerList>();
  static ServerList getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyServerList();
    return _defaultInstance;
  }
  static ServerList _defaultInstance;
  static void $checkItem(ServerList v) {
    if (v is! ServerList) checkItemFailed(v, 'ServerList');
  }

  List<Symptom> get symptoms => $_getList(0);
}

class _ReadonlyServerList extends ServerList with ReadonlyMessageMixin {}

class UserSelection extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UserSelection')
    ..pPS(1, 'input')
    ..hasRequiredFields = false
  ;

  UserSelection() : super();
  UserSelection.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserSelection.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserSelection clone() => new UserSelection()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static UserSelection create() => new UserSelection();
  static PbList<UserSelection> createRepeated() => new PbList<UserSelection>();
  static UserSelection getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUserSelection();
    return _defaultInstance;
  }
  static UserSelection _defaultInstance;
  static void $checkItem(UserSelection v) {
    if (v is! UserSelection) checkItemFailed(v, 'UserSelection');
  }

  List<String> get input => $_getList(0);
}

class _ReadonlyUserSelection extends UserSelection with ReadonlyMessageMixin {}

class ServerFeedback extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ServerFeedback')
    ..aQS(1, 'input')
    ..a<bool>(2, 'doneFlag', PbFieldType.QB)
    ..a<bool>(3, 'solvedFlag', PbFieldType.QB)
  ;

  ServerFeedback() : super();
  ServerFeedback.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ServerFeedback.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ServerFeedback clone() => new ServerFeedback()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ServerFeedback create() => new ServerFeedback();
  static PbList<ServerFeedback> createRepeated() => new PbList<ServerFeedback>();
  static ServerFeedback getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyServerFeedback();
    return _defaultInstance;
  }
  static ServerFeedback _defaultInstance;
  static void $checkItem(ServerFeedback v) {
    if (v is! ServerFeedback) checkItemFailed(v, 'ServerFeedback');
  }

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);

  bool get doneFlag => $_get(1, false);
  set doneFlag(bool v) { $_setBool(1, v); }
  bool hasDoneFlag() => $_has(1);
  void clearDoneFlag() => clearField(2);

  bool get solvedFlag => $_get(2, false);
  set solvedFlag(bool v) { $_setBool(2, v); }
  bool hasSolvedFlag() => $_has(2);
  void clearSolvedFlag() => clearField(3);
}

class _ReadonlyServerFeedback extends ServerFeedback with ReadonlyMessageMixin {}

class UserFeedback extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UserFeedback')
    ..a<bool>(1, 'input', PbFieldType.QB)
  ;

  UserFeedback() : super();
  UserFeedback.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserFeedback.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserFeedback clone() => new UserFeedback()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static UserFeedback create() => new UserFeedback();
  static PbList<UserFeedback> createRepeated() => new PbList<UserFeedback>();
  static UserFeedback getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUserFeedback();
    return _defaultInstance;
  }
  static UserFeedback _defaultInstance;
  static void $checkItem(UserFeedback v) {
    if (v is! UserFeedback) checkItemFailed(v, 'UserFeedback');
  }

  bool get input => $_get(0, false);
  set input(bool v) { $_setBool(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class _ReadonlyUserFeedback extends UserFeedback with ReadonlyMessageMixin {}

class ErrorResolutionApi {
  RpcClient _client;
  ErrorResolutionApi(this._client);

  Future<ServerList> getSymptomList(ClientContext ctx, UserQuery request) {
    var emptyResponse = new ServerList();
    return _client.invoke<ServerList>(ctx, 'ErrorResolution', 'getSymptomList', request, emptyResponse);
  }
  Future<ServerFeedback> startSession(ClientContext ctx, UserSelection request) {
    var emptyResponse = new ServerFeedback();
    return _client.invoke<ServerFeedback>(ctx, 'ErrorResolution', 'startSession', request, emptyResponse);
  }
  Future<ServerFeedback> getNextQuestion(ClientContext ctx, UserFeedback request) {
    var emptyResponse = new ServerFeedback();
    return _client.invoke<ServerFeedback>(ctx, 'ErrorResolution', 'getNextQuestion', request, emptyResponse);
  }
}

