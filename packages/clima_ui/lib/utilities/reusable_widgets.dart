import 'package:clima_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class ReusableWidgets extends StatelessWidget {
  const ReusableWidgets({this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    final _themeState = context.read(themeStateNotifier);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _themeState.isDarkTheme
              ? const Color(0xFF171717)
              : const Color(0xFFFCFCFC),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: cardChild,
          ),
        ),
      ),
    );
  }
}

Future<SnackBar> snackBar(
    {String text, SnackBarAction action, int duration = 2}) async {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: duration),
    content: Text(text),
    action: action,
  );
}
