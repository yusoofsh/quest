// We create a "provider", which will store a value (here "Xaltius Quest").
// By using a provider, this allows us to mock/override the value exposed.
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider((_) => 'Xaltius Quest');
