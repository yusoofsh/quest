import 'package:quest/domain/model/people.dart';
import 'package:quest/domain/util/dio.dart';

/// A direct communication with APIs.
class PeopleRepository {
  /// Fetch [PeopleModel] data from server and returns the response.
  static Future<List<PeopleModel>> fetchPeoples() async {
    final _response = await dio.get<List<dynamic>>('/data/data');

    final _result = _response.data.map(
      (dynamic iterable) {
        return PeopleModel.fromJson(
          iterable as Map<String, dynamic>,
        );
      },
    ).toList();

    return _result;
  }
}
