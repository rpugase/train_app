import 'package:flutter/material.dart';
import 'package:flutterapp/domain/user.dart';
import 'package:flutterapp/page/home.dart';
import 'package:flutterapp/page/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
