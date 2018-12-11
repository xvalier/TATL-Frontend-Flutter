///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

const UserQuery$json = const {
  '1': 'UserQuery',
  '2': const [
    const {'1': 'input', '3': 1, '4': 2, '5': 9, '10': 'input'},
  ],
};

const Symptom$json = const {
  '1': 'Symptom',
  '2': const [
    const {'1': 'input', '3': 1, '4': 2, '5': 9, '10': 'input'},
  ],
};

const ServerList$json = const {
  '1': 'ServerList',
  '2': const [
    const {'1': 'symptoms', '3': 1, '4': 3, '5': 11, '6': '.sets.Symptom', '10': 'symptoms'},
  ],
};

const UserSelection$json = const {
  '1': 'UserSelection',
  '2': const [
    const {'1': 'input', '3': 1, '4': 3, '5': 9, '10': 'input'},
  ],
};

const ServerFeedback$json = const {
  '1': 'ServerFeedback',
  '2': const [
    const {'1': 'input', '3': 1, '4': 2, '5': 9, '10': 'input'},
    const {'1': 'doneFlag', '3': 2, '4': 2, '5': 8, '10': 'doneFlag'},
    const {'1': 'solvedFlag', '3': 3, '4': 2, '5': 8, '10': 'solvedFlag'},
  ],
};

const UserFeedback$json = const {
  '1': 'UserFeedback',
  '2': const [
    const {'1': 'input', '3': 1, '4': 2, '5': 8, '10': 'input'},
  ],
};

const ErrorResolution$json = const {
  '1': 'ErrorResolution',
  '2': const [
    const {'1': 'getSymptomList', '2': '.sets.UserQuery', '3': '.sets.ServerList', '4': const {}},
    const {'1': 'startSession', '2': '.sets.UserSelection', '3': '.sets.ServerFeedback', '4': const {}},
    const {'1': 'getNextQuestion', '2': '.sets.UserFeedback', '3': '.sets.ServerFeedback', '4': const {}},
  ],
};

const ErrorResolution$messageJson = const {
  '.sets.UserQuery': UserQuery$json,
  '.sets.ServerList': ServerList$json,
  '.sets.Symptom': Symptom$json,
  '.sets.UserSelection': UserSelection$json,
  '.sets.ServerFeedback': ServerFeedback$json,
  '.sets.UserFeedback': UserFeedback$json,
};

