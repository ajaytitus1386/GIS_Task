import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> splashPageBuilder(
    Widget nextPage, BuildContext context) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 900),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return nextPage;
    },
  );
}
