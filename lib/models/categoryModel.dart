
class CategoryModel {
  String type;
  int categoryKey;

  CategoryModel({this.type, this.categoryKey});

}

/*
class CategoryModel {
  String key;
  String subject;
  bool completed;
  String userId;

  CategoryModel(this.subject, this.userId, this.completed);

  CategoryModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        userId = snapshot.value["userId"],
        subject = snapshot.value["subject"],
        completed = snapshot.value["completed"];

  toJson() {
    return {
      "userId": userId,
      "subject": subject,
      "completed": completed,
    };
  }
}
*/