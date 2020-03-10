/*
import 'package:firebase_database/firebase_database.dart';


class CategoryModel {
  String type;
  int categoryKey;

  CategoryModel({this.type, this.categoryKey});

}
*/

class CategoryModel {
  String id;
  String type;

  CategoryModel({this.type, this.id});

  CategoryModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        type = snapshot["type"] ?? '';

  toJson() {
    return {
      "id": id,
      "type": type,
    };
  }
}
