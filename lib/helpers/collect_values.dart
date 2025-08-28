import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Combines multiple AsyncValues into one AsyncValue<List<T>>.
/// Useful if the app wants to wait for multiple settings at once.
AsyncValue<List<T>> combineSettings<T>(List<AsyncValue<T>> values) {
  if (values.any((v) => v.isLoading)) return const AsyncValue.loading();
  if (values.any((v) => v.hasError)) {
    final err = values.firstWhere((v) => v.hasError);
    return AsyncValue.error(err.error!, err.stackTrace ?? StackTrace.current);
  }
  return AsyncValue.data(values.map((v) => v.value as T).toList());
}
