// We create a "provider", which will store a value (here "Hello").
// By using a provider, this allows us to mock/override the value exposed.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quest/domain/value/value.dart' as value;

/// Provides hello strings to anywhere of
/// the application and watch the changes.
final helloProvider = Provider((_) => value.hello);
