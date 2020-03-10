import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Customer(),
  ));
}

class Customer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Support"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                child: Text('FAQ'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ),
            Center(
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                child: Text('Feedback'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendEmail()),
                  );
                },
              ),
            ),
            Center(
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                child: Text('Account Recovery'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountRoute()),
                  );
                },
              ),
            ),
            Center(
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                child: Text(' Change Password'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordRoute()),
                  );
                },
              ),
            )
          ]),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FAQ"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text("What is Coyote Connections? ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                child: Text(
                    "It is a way for students to see what they would like to do in CSUSB."),
              ),
              Container(
                child: Text(" 2. How can I create a account?",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                  child: Text(
                      " All you would need to do is create account in our account sign up page. All you would need is a account name and password. If you want put a personal number or email.")),
              Container(
                  child: Text(
                "3.What if I forgot my account user name and password?",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                      "All you would need to do is go to our account recovery page to get started on the process.")),
              Container(
                child: Text("4. Why a feed backpage? ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                  child: Text(
                      "That is for the developers to make improvements later in the future so the app can be perfect."))
            ]));
  }
}

class SendEmail extends StatelessWidget {
  final String _emailController = 'callofjonh@gmail.com';
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  _sendEmail() async {
    final String _email = 'mailto:' +
        _emailController +
        '?subject=' +
        _subjectController.text +
        '&body=' +
        _bodyController.text;
    try {
      await launch(_email);
    } catch (e) {
      throw 'Could not Call Phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Feedback')),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("Please fill email and the subject box what it says."),
          TextField(
            controller: _subjectController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Subject put feedback',
            ),
          ),
          TextField(
            controller: _bodyController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Insert feedback',
            ),
          ),
          RaisedButton(
            child: Text('Send Email'),
            color: Colors.blue,
            onPressed: _sendEmail,
          ),
        ],
      )),
    );
  }
}

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account Recovery"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Text(
                  'Forgot your account information please enter your email linked to your account.'),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendRoute()),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class SendRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Thank you"),
        ),
        body: Column(children: <Widget>[
          Center(
              child: Text(
                  "Thank you for giving your info we will get back to you")),
          Center(
            child: RaisedButton(
                child: Text("Go back"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Customer()),
                  );
                }),
          )
        ]));
  }
}

class PasswordRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Change Password"),
        ),
        body: Column(children: <Widget>[
          Center(
              child: Text(
                  "If you want to make a new password please fill out the infomation down below.")),
          Container(
            child: TextFormField(
              decoration: InputDecoration(labelText: "Old Password"),
              obscureText: true,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(labelText: "New Password"),
              obscureText: true,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(labelText: "Confirm password"),
              obscureText: true,
            ),
          ),
          Center(
            child: RaisedButton(
                child: Text("Confirm"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RemakeRoute()),
                  );
                }),
          ),
        ]));
  }
}

class RemakeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Thank you"),
        ),
        body: Column(children: <Widget>[
          Center(child: Text("Your password has been changed")),
          Center(
            child: RaisedButton(
                child: Text("Go back"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Customer()),
                  );
                }),
          )
        ]));
  }
}

class ThanksRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Thank you"),
        ),
        body: Column(children: <Widget>[
          Center(
              child: Text("Thanks for the feedback we will take it to heart")),
          Center(
            child: RaisedButton(
                child: Text("Go back"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Customer()),
                  );
                }),
          )
        ]));
  }
}
