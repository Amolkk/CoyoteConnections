import "package:firebase_database/firebase_database.dart";

class AdminUser {
  String uid; //if problen do final
  String email;
  int phoneNo;
  AdminUser({this.uid, this.email, this.phoneNo});

  AdminUser.fromSnapshot(DataSnapshot snapshot)
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
