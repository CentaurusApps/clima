import 'package:clima_core/failure.dart';
import 'package:flutter/material.dart';

SnackBar failureSnackBar({
  @required Failure failure,
  VoidCallback onRetry,
  int duration,
}) {
  final text = () {
    if (failure is NoConnection) {
      return 'No network connection';
    } else if (failure is FailedToParseResponse) {
      return 'Could not parse response';
    } else if (failure is ServerDown) {
      return "Can't connect to server";
    } else if (failure is InvalidCityName) {
      return 'Invalid city name';
    } else {
      throw ArgumentError('Did not expect $failure');
    }
  }();

  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(text),
    duration: Duration(seconds: duration ?? 86400),
    action: onRetry != null
        ? SnackBarAction(label: 'Retry', onPressed: onRetry)
        : null,
  );
}
