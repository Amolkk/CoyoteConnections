//import 'package:categories2/screens/wrapper.dart';
import 'package:categories2/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:categories2/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
          toggleView:
              toggleView); // property name can be whatever you want, the value has to be the function above
    } else {
      return Register(toggleView: toggleView); //
    }
  }
}
