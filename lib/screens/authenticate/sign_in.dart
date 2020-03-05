import 'package:categories2/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authSign =
      AuthService(); // _authSign doesnt have to be the same as _auth in sign_in.dart file
  final _formKey = GlobalKey<FormState>();
  //
  //text field state
  String email = '';
  String password = '';
  String error = '';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      primary: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //ImageBanner('lib/assets/images/coyote.png'), //another try
          Expanded(
              child: Image.asset('lib/ass/coyote.png')), //trying to add image
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //EMAIL input field
                  SizedBox(height: 20.0),
                  //
                  //
                  //
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter your Email'),
                    validator: (val) => val.isEmpty ? "Enter an Email" : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  //PASSWORD input field
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your Password'),
                    validator: (val) => val.length < 6
                        ? "Enter a Password greater than 6 letters"
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  //SUBMIT Button
                  SizedBox(height: 40.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                            color: Colors.pink[400],
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _authSign.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() => error =
                                      'Could not sign in with those credentials'); //not working

                                }
                              }
                            }),
                        RaisedButton(
                            color: Colors.pink[400],
                            child: Text(
                              ' Guest',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              //dynamic result = await
                              _authSign.singInAnon();
                            }),
                      ]),

                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 200.0),
        //decoration: BoxDecoration(color: Colors.grey),
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ));
  }
}
