///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class NewUser extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('NewUser')
    ..aOS(1, 'email')
    ..aOS(2, 'pass')
    ..aOS(3, 'organization')
    ..aOS(4, 'role')
    ..aOS(5, 'devID')
    ..hasRequiredFields = false
  ;

  NewUser() : super();
  NewUser.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NewUser.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NewUser clone() => new NewUser()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static NewUser create() => new NewUser();
  static PbList<NewUser> createRepeated() => new PbList<NewUser>();
  static NewUser getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyNewUser();
    return _defaultInstance;
  }
  static NewUser _defaultInstance;
  static void $checkItem(NewUser v) {
    if (v is! NewUser) checkItemFailed(v, 'NewUser');
  }

  String get email => $_getS(0, '');
  set email(String v) { $_setString(0, v); }
  bool hasEmail() => $_has(0);
  void clearEmail() => clearField(1);

  String get pass => $_getS(1, '');
  set pass(String v) { $_setString(1, v); }
  bool hasPass() => $_has(1);
  void clearPass() => clearField(2);

  String get organization => $_getS(2, '');
  set organization(String v) { $_setString(2, v); }
  bool hasOrganization() => $_has(2);
  void clearOrganization() => clearField(3);

  String get role => $_getS(3, '');
  set role(String v) { $_setString(3, v); }
  bool hasRole() => $_has(3);
  void clearRole() => clearField(4);

  String get devID => $_getS(4, '');
  set devID(String v) { $_setString(4, v); }
  bool hasDevID() => $_has(4);
  void clearDevID() => clearField(5);
}

class _ReadonlyNewUser extends NewUser with ReadonlyMessageMixin {}

class User extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('User')
    ..aOS(1, 'email')
    ..aOS(2, 'pass')
    ..aOS(3, 'devID')
    ..hasRequiredFields = false
  ;

  User() : super();
  User.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  User.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  User clone() => new User()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static User create() => new User();
  static PbList<User> createRepeated() => new PbList<User>();
  static User getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUser();
    return _defaultInstance;
  }
  static User _defaultInstance;
  static void $checkItem(User v) {
    if (v is! User) checkItemFailed(v, 'User');
  }

  String get email => $_getS(0, '');
  set email(String v) { $_setString(0, v); }
  bool hasEmail() => $_has(0);
  void clearEmail() => clearField(1);

  String get pass => $_getS(1, '');
  set pass(String v) { $_setString(1, v); }
  bool hasPass() => $_has(1);
  void clearPass() => clearField(2);

  String get devID => $_getS(2, '');
  set devID(String v) { $_setString(2, v); }
  bool hasDevID() => $_has(2);
  void clearDevID() => clearField(3);
}

class _ReadonlyUser extends User with ReadonlyMessageMixin {}

class Receipt extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Receipt')
    ..aOS(1, 'message')
    ..aOB(2, 'successFlag')
    ..aOS(3, 'token')
    ..hasRequiredFields = false
  ;

  Receipt() : super();
  Receipt.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Receipt.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Receipt clone() => new Receipt()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Receipt create() => new Receipt();
  static PbList<Receipt> createRepeated() => new PbList<Receipt>();
  static Receipt getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReceipt();
    return _defaultInstance;
  }
  static Receipt _defaultInstance;
  static void $checkItem(Receipt v) {
    if (v is! Receipt) checkItemFailed(v, 'Receipt');
  }

  String get message => $_getS(0, '');
  set message(String v) { $_setString(0, v); }
  bool hasMessage() => $_has(0);
  void clearMessage() => clearField(1);

  bool get successFlag => $_get(1, false);
  set successFlag(bool v) { $_setBool(1, v); }
  bool hasSuccessFlag() => $_has(1);
  void clearSuccessFlag() => clearField(2);

  String get token => $_getS(2, '');
  set token(String v) { $_setString(2, v); }
  bool hasToken() => $_has(2);
  void clearToken() => clearField(3);
}

class _ReadonlyReceipt extends Receipt with ReadonlyMessageMixin {}

class UserQuery extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UserQuery')
    ..aOS(1, 'input')
    ..aOS(2, 'token')
    ..hasRequiredFields = false
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

  String get token => $_getS(1, '');
  set token(String v) { $_setString(1, v); }
  bool hasToken() => $_has(1);
  void clearToken() => clearField(2);
}

class _ReadonlyUserQuery extends UserQuery with ReadonlyMessageMixin {}

class Symptom extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Symptom')
    ..aOS(1, 'input')
    ..hasRequiredFields = false
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
    ..hasRequiredFields = false
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
    ..aOS(1, 'input')
    ..aOS(2, 'token')
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

  String get input => $_getS(0, '');
  set input(String v) { $_setString(0, v); }
  bool hasInput() => $_has(0);
  void clearInput() => clearField(1);

  String get token => $_getS(1, '');
  set token(String v) { $_setString(1, v); }
  bool hasToken() => $_has(1);
  void clearToken() => clearField(2);
}

class _ReadonlyUserSelection extends UserSelection with ReadonlyMessageMixin {}

class ServerFeedback extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ServerFeedback')
    ..aOS(1, 'input')
    ..aOB(2, 'doneFlag')
    ..aOB(3, 'solvedFlag')
    ..hasRequiredFields = false
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
    ..aOB(1, 'input')
    ..aOS(2, 'token')
    ..hasRequiredFields = false
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

  String get token => $_getS(1, '');
  set token(String v) { $_setString(1, v); }
  bool hasToken() => $_has(1);
  void clearToken() => clearField(2);
}

class _ReadonlyUserFeedback extends UserFeedback with ReadonlyMessageMixin {}

