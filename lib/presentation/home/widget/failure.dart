import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quest/domain/value/value.dart' as value;

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    @required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    final _error = error as DioError;
    final _code = _error.response.statusCode;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              'asset/image/not_found.png',
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 1.5,
            ),
            const SizedBox(height: 16.0),
            Text(
              value.notFound,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '${value.currentUrl} $_code',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
