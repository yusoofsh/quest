import 'package:quest/domain/util/dio.dart';

/// A direct communication with APIs.
class People {
  /// Fetch [People] data from server and returns the response.
  Future<People> fetchPeoples() async {
    final _response = await dio.get<People>(
      'http://localhost:8084/data/data',
    );

    // Validate status code whether success or not.
    if (_response.statusCode == 200) {
      // Continue.
      return _response.data;
    } else {
      throw Exception('Something wrong');
    }
  }
}
