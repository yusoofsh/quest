import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quest/domain/value/value.dart' as value;

/// An instance utility for Dio.
final dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options) async {
        // Do something before request is sent.
        options.baseUrl = value.baseUrl;
        // Extend timout.
        options.connectTimeout = 5000;
        options.receiveTimeout = 3000;

        return options;
      },
      onError: (error) {
        // Do something with response error.
        //
        // Make sure not to clutter production.
        debugPrint(error.response.toString());

        return error;
      },
    ),
  );
