import 'package:categories2/screens/home/home.dart';
import 'package:flutter/material.dart';

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
      body: Column(children: <Widget>[
        Center(
          child: RaisedButton(
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
            child: Text('Feedback'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdRoute()),
              );
            },
          ),
        ),
        Center(
          child: RaisedButton(
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
      body: Center(
        child: Text(
            "What iis Coyote Connections?\n It is a way for international students to see what they would like to do in CSUSB.\n 2. How can I create a account? \n All you would need to do is create account in our account sign up page. All you would need is a account name and password. If you want put a personal number or email."
            ""
            "\n3.What if I forgot my account user name and password? \n All you would need to do is go to our account recovery page to get started on the process.\n 4. Why a feed backpage? \n That is for the developers to make improvements later in the future so the app can be perfect.  "),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: Column(children: <Widget>[
        Container(
          child: TextFormField(
            decoration:
                InputDecoration(labelText: "What do you want to tell us"),
          ),
        ),
        Center(
          child: RaisedButton(
            child: Text("Send"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThanksRoute()),
              );
            },
          ),
        ),
      ]),
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
                    MaterialPageRoute(builder: (context) => Home()),
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
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(labelText: "New Password"),
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(labelText: "Confirm password"),
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
                    MaterialPageRoute(builder: (context) => Home()),
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
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }),
          )
        ]));
  }
}
