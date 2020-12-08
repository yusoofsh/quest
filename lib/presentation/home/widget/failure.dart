import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/application/provider/home.dart';
import 'package:quest/domain/value/value.dart' as value;

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    @required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    final _message = parseMessage(error);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              'asset/image/not_found.png',
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 1.6,
            ),
            Text(
              value.notFound,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '${value.currentUrl} $_message',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const SizedBox(height: 16.0),
            OutlineButton(
              onPressed: () => context.refresh(peopleProvider),
              child: const Text(value.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
