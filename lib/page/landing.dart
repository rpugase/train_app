import 'package:flutter/material.dart';
import 'package:flutterapp/page/home.dart';
import 'package:flutterapp/page/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = true;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
