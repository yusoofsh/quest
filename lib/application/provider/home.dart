import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/domain/model/people.dart';
import 'package:quest/infrastructure/repository/people.dart';

/// Provide the people data.
final peopleProvider = FutureProvider<PeopleModel>(
  (_) => PeopleRepository.fetchPeoples(),
);
