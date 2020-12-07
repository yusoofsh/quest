import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// An instance utility for Dio.
final dio = Dio()
  ..interceptors.add(
    // We configure interceptors.
    InterceptorsWrapper(
      onRequest: (options) async {
        // Do something before request is sent.
        options.merge(
          // Extend timout.
          connectTimeout: 5000,
          receiveTimeout: 3000,
        );

        // Continue.
        return options;
      },
      onError: (error) {
        // Do something with response error.
        //
        // Make sure not to clutter production.
        debugPrint(error.response.toString());

        // Continue.
        return error;
      },
    ),
  );
