import "package:firebase_database/firebase_database.dart";

class User {
  String uid; //if problen do final
  String email;
  int phoneNo;
  User({this.uid, this.email, this.phoneNo});

  User.fromSnapshot(DataSnapshot snapshot)
      : // uid = snapshot.uid,
        email = snapshot.value['email'],
        phoneNo = snapshot.value['phoneNo'];

  toJson() {
    return {
      "uid": uid,
      "email": email,
      "phoneNo": phoneNo,
    };
  }
}
