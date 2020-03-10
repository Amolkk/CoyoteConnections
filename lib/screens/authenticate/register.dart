import 'package:flutter/material.dart';
import 'package:categories2/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        title: Text('Sign UP'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.account_circle),
              label: Text('Sign In'))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Image.asset('lib/ass/coyote.png')),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //EMAIL input field
                  SizedBox(height: 20.0),
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
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Container(
                      child: Text(
                        'Register ',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: const BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(55)),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _authSign
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error =
                              'please supply a valid email'); //not working
                        }
                      }
                    },
                  ),
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
