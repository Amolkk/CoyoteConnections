import 'package:categories2/screens/customerservice/customerservice.dart';
import 'package:categories2/screens/home/category.dart';
import 'package:categories2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.uid, this.logoutCallback}) : super(key: key);

  final BaseAuth auth;
  final String uid;
  final VoidCallback logoutCallback;

  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'ass/coyote.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
          ],
        ), //Text('Home'),
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //button that connects to the Customer service file made by John
        backgroundColor: Colors.orangeAccent[200],
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Customer()),
          );
        },
        child: Icon(Icons.help),
      ),
      /* 

      this is if you want to name each category individually which is what we want 
      body: Column(
        children: <Widget>[
          Category('Category 1'),
          Category('Category 2'),
          Category("Category 3")
        ],
      ), 
      */

/* here we can use a global key for the sub categories to facilitate the flow
 of the pages instead of writing entire pages again and again */

      body: GridView.count(
          crossAxisSpacing: 5,
          //physics: ScrollPhysics.(child: spring), //cannot implement at the time
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          // shrinkWrap: false, //does not seem do anything at the moment
          children: <Widget>[
            Category('Sports'), Category('Academic'), Category('Social'),
            Category('categoryName')
            // List.generate(10, (index) {
            //   return Center(child: Category('Category $index'));
            // }),)
          ]),
    );
  }
}
