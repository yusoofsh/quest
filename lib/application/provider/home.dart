import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/domain/model/people.dart';
import 'package:quest/domain/value/value.dart' as value;
import 'package:quest/infrastructure/repository/people.dart';

/// Provide the people data.
final peopleProvider = FutureProvider.autoDispose<List<PeopleModel>>(
  (_) => fetchPeoples(),
);

/// Provide the people data.
final greetingsProvider = StateProvider<String>(
  (_) => value.greetings,
);

// Iterate response map data to lists.
List<PeopleModel> iterateResponseMap(Response<List<dynamic>> response) {
  final _result = response.data.map(
    (dynamic iterable) {
      return PeopleModel.fromJson(
        iterable as Map<String, dynamic>,
      );
    },
  ).toList();

  return _result;
}

// Parse the error to user-friendly message.
String parseMessage(Object error) {
  final _error = error as DioError;
  final _message = _error.message;

  if (_error.response != null) {
    return _error.response.statusMessage.toLowerCase();
  } else {
    const _start = 'Error: ';
    const _end = ',';

    final startIndex = _message.indexOf(_start);
    final endIndex = _message.indexOf(
      _end,
      startIndex + _start.length,
    );

    final _parsed = _message
        .substring(
          startIndex + _start.length,
          endIndex,
        )
        .toLowerCase();

    return _parsed;
  }
}
