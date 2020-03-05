import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  //@override
  final String categoryName;
  Category(this.categoryName);

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.blue[50],
          border: Border.all(width: 8, color: Colors.blue[400]),
          borderRadius: const BorderRadius.all(const Radius.circular(50)),
        ),
        margin: const EdgeInsets.all(5),
        //  decoration: BoxDecoration(color: Colors.white),
        child: SizedBox(
          width: 300,
          height: 300,
          child: FlatButton(
            onPressed: null,
            padding: const EdgeInsets.all(2.5),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Container(
                child: Center(
                  child: Text(
                    categoryName, //argument passed in name from the home.dart file
                    style: TextStyle(
                        height: 5,
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w900), //fontsize of the Category $index
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(30)), //button rounded
                  gradient: LinearGradient(
                    //gives gradient to the Category $index button

                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F9),
                    ],
                  ),
                ),
                //padding: const EdgeInsets.all(2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
