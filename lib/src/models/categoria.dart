class CategoryModel {
  int id;
  String name;

  int get ctgyId => id;
  String get ctgyname => name;

  CategoryModel({this.id, this.name});

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'name': name};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
