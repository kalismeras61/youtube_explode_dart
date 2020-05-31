import 'dart:async';

import 'exceptions/exceptions.dart';

/// Run the [function] each time an exception is thrown until the retryCount
/// is 0.
Future<T> retry<T>(FutureOr<T> function()) async {
  var retryCount = 5;

  while (true) {
    try {
      return await function();
      // ignore: avoid_catches_without_on_clauses
    } on Exception catch (e) {
      retryCount -= getExceptionCost(e);
      if (retryCount <= 0) {
        rethrow;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}

/// Get "retry" cost of each YoutubeExplode exception.
int getExceptionCost(Exception e) {
  if (e is TransientFailureException) {
    return 1;
  }
  if (e is RequestLimitExceeded) {
    return 2;
  }
  if (e is FatalFailureException) {
    return 3;
  }
  return 100;
}