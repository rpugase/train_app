import  'package:flutter/material.dart';
import 'package:flutterapp/domain/user.dart';
import 'package:flutterapp/services/auth.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showLogin = true;

  AuthService _authService = AuthService();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          SizedBox(height: 50,),
          _form(_showLogin ? 'Login' : 'Register',
              _showLogin ? _onSignInPressed : _onRegisterPressed),
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              child: Text(_showLogin ? 'No Registered yet? Register!' : 'Already registered? Login! ',
                style: TextStyle(fontSize: 20, color: Colors.white),),
              onTap: () {
                setState(() {
                  _showLogin = !_showLogin;
                });
              },
            ),
          ),
          _bottomWave(),
        ],
      ),
    );
  }

  Widget _logo() => Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        child: Text(
            'FIT',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );

  Widget _form(String buttonText, VoidCallback onPressed) => Column(
    children: <Widget>[
      SizedBox(height: 20),
      _input(Icons.email, 'E-mail', _emailController, false),
      SizedBox(height: 20),
      _input(Icons.lock, 'Password', _passwordController, true),
      SizedBox(height: 20),
//      Expanded(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: RaisedButton(
            color: Colors.white,
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
//      )
    ],
  );

  Widget _input(
      IconData icon,
      String label,
      TextEditingController textEditingController,
      bool obscure
      ) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: textEditingController,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white54,
                width: 1,
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(icon),
              ),
            )
          ),
        ),
  );

  _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  _onRegisterPressed() async {
    final _email = _emailController.text;
    final _password = _passwordController.text;

    if (_email.isNotEmpty && _password.isNotEmpty) {
      User user = await _authService.registerInWithEmailAndPassword(_email.trim(), _password.trim());

      print(user);

      if (user == null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Not Registered')));
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Fill fields')));
    }
  }

  _onSignInPressed() async {
    final _email = _emailController.text;
    final _password = _passwordController.text;

    if (_email.isNotEmpty && _password.isNotEmpty) {
      User user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim());

      print(user);

      if (user == null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Not Registered')));
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Fill fields')));
    }
  }
}

class BottomWaveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - size.width / 6, size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
