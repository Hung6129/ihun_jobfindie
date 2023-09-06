import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider will be used to track the current page index
/// And will be used to update the dots indicator
final indexPageProvider = StateProvider<int>((ref) => 0);