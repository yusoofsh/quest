import 'package:quest/domain/model/people.dart';
import 'package:quest/domain/util/dio.dart';
import 'package:quest/domain/value/value.dart' as value;

/// A direct communication with APIs.
class PeopleRepository {
  /// Fetch [PeopleModel] data from server and returns the response.
  static Future<PeopleModel> fetchPeoples() async {
    final _response = await dio.get<PeopleModel>(
      '${value.baseUrl}/data/data',
    );

    // Validate status code whether success or not.
    if (_response.statusCode == 200) {
      // Continue.
      return _response.data;
    } else {
      throw Exception(value.exceptionMessage);
    }
  }
}
