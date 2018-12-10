///
//  Generated code. Do not modify.
//  source: sets.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;
// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

class UserQuery extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UserQuery', package: const $pb.PackageName('sets'))
    ..aQS(1, 'input')
  ;

  UserQuery() : super();
  UserQuery.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserQuery.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserQuery clone() => new UserQuery()..mergeFromMessage(this);
  UserQuery copyWith(void Function(UserQuery) updates) => super.copyWith((message) => updates(message as UserQuery));
  $pb.BuilderInfo get info_ => _i;
  static UserQuery create() => new UserQuery();
  static $pb.PbList<UserQuery> createRepeated() => new $pb.PbList<UserQuery>();
  static UserQuery getDefault() => _defaultInstance ??= create()..freeze();
  static UserQuery _defaultInstance;
  static void $checkItem(UserQuery v) {
    if (v is! UserQuery) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class Symptom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Symptom', package: const $pb.PackageName('sets'))
    ..aQS(1, 'input')
  ;

  Symptom() : super();
  Symptom.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Symptom.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Symptom clone() => new Symptom()..mergeFromMessage(this);
  Symptom copyWith(void Function(Symptom) updates) => super.copyWith((message) => updates(message as Symptom));
  $pb.BuilderInfo get info_ => _i;
  static Symptom create() => new Symptom();
  static $pb.PbList<Symptom> createRepeated() => new $pb.PbList<Symptom>();
  static Symptom getDefault() => _defaultInstance ??= create()..freeze();
  static Symptom _defaultInstance;
  static void $checkItem(Symptom v) {
    if (v is! Symptom) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class ServerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ServerList', package: const $pb.PackageName('sets'))
    ..pp<Symptom>(1, 'symptoms', $pb.PbFieldType.PM, Symptom.$checkItem, Symptom.create)
  ;

  ServerList() : super();
  ServerList.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ServerList.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ServerList clone() => new ServerList()..mergeFromMessage(this);
  ServerList copyWith(void Function(ServerList) updates) => super.copyWith((message) => updates(message as ServerList));
  $pb.BuilderInfo get info_ => _i;
  static ServerList create() => new ServerList();
  static $pb.PbList<ServerList> createRepeated() => new $pb.PbList<ServerList>();
  static ServerList getDefault() => _defaultInstance ??= create()..freeze();
  static ServerList _defaultInstance;
  static void $checkItem(ServerList v) {
    if (v is! ServerList) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<Symptom> get symptoms => $_getList(0);
}

class UserSelection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UserSelection', package: const $pb.PackageName('sets'))
    ..pPS(1, 'input')
    ..hasRequiredFields = false
  ;

  UserSelection() : super();
  UserSelection.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserSelection.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserSelection clone() => new UserSelection()..mergeFromMessage(this);
  UserSelection copyWith(void Function(UserSelection) updates) => super.copyWith((message) => updates(message as UserSelection));
  $pb.BuilderInfo get info_ => _i;
  static UserSelection create() => new UserSelection();
  static $pb.PbList<UserSelection> createRepeated() => new $pb.PbList<UserSelection>();
  static UserSelection getDefault() => _defaultInstance ??= create()..freeze();
  static UserSelection _defaultInstance;
  static void $checkItem(UserSelection v) {
    if (v is! UserSelection) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<String> get input => $_getList(0);
}

class ServerFeedback extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ServerFeedback', package: const $pb.PackageName('sets'))
    ..aQS(1, 'input')
    ..a<bool>(2, 'doneFlag', $pb.PbFieldType.QB)
    ..a<bool>(3, 'solvedFlag', $pb.PbFieldType.QB)
  ;

  ServerFeedback() : super();
  ServerFeedback.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ServerFeedback.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ServerFeedback clone() => new ServerFeedback()..mergeFromMessage(this);
  ServerFeedback copyWith(void Function(ServerFeedback) updates) => super.copyWith((message) => updates(message as ServerFeedback));
  $pb.BuilderInfo get info_ => _i;
  static ServerFeedback create() => new ServerFeedback();
  static $pb.PbList<ServerFeedback> createRepeated() => new $pb.PbList<ServerFeedback>();
  static ServerFeedback getDefault() => _defaultInstance ??= create()..freeze();
  static ServerFeedback _defaultInstance;
  static void $checkItem(ServerFeedback v) {
    if (v is! ServerFeedback) $pb.checkItemFailed(v, _i.qualifiedMessageName);
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

class UserFeedback extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UserFeedback', package: const $pb.PackageName('sets'))
    ..a<bool>(1, 'input', $pb.PbFieldType.QB)
  ;

  UserFeedback() : super();
  UserFeedback.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserFeedback.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserFeedback clone() => new UserFeedback()..mergeFromMessage(this);
  UserFeedback copyWith(void Function(UserFeedback) updates) => super.copyWith((message) => updates(message as UserFeedback));
  $pb.BuilderInfo get info_ => _i;
  static UserFeedback create() => new UserFeedback();
  static $pb.PbList<UserFeedback> createRepeated() => new $pb.PbList<UserFeedback>();
  static UserFeedback getDefault() => _defaultInstance ??= create()..freeze();
  static UserFeedback _defaultInstance;
  static void $checkItem(UserFeedback v) {
    if (v is! UserFeedback) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  bool get input => $_get(0, false);
  set input(bool v) { $_setBool(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);
}

class ErrorResolutionApi {
  $pb.RpcClient _client;
  ErrorResolutionApi(this._client);

  $async.Future<ServerList> getSymptomList($pb.ClientContext ctx, UserQuery request) {
    var emptyResponse = new ServerList();
    return _client.invoke<ServerList>(ctx, 'ErrorResolution', 'getSymptomList', request, emptyResponse);
  }
  $async.Future<ServerFeedback> startSession($pb.ClientContext ctx, UserSelection request) {
    var emptyResponse = new ServerFeedback();
    return _client.invoke<ServerFeedback>(ctx, 'ErrorResolution', 'startSession', request, emptyResponse);
  }
  $async.Future<ServerFeedback> getNextQuestion($pb.ClientContext ctx, UserFeedback request) {
    var emptyResponse = new ServerFeedback();
    return _client.invoke<ServerFeedback>(ctx, 'ErrorResolution', 'getNextQuestion', request, emptyResponse);
  }
}

