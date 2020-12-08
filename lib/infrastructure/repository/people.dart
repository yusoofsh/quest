import 'package:quest/domain/model/people.dart';
import 'package:quest/domain/utility/dio.dart';
import 'package:quest/domain/value/value.dart' as value;

/// A direct communication with APIs.
class PeopleRepository {
  /// Fetch [PeopleModel] data from server and returns the response.
  static Future<List<PeopleModel>> fetchPeoples() async {
    final _response = await dio.get<List<dynamic>>(value.dataPath);

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
