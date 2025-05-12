class TodoModel {
  final String title;
  final String description;
  final String? id;

  TodoModel({required this.title, required this.description, this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'],
        description: json['description'],
        id: json['_id']);
  }

  toJson() {
    return {'title': title, 'description': description, '_id': id};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TodoModel &&
      other.title == title &&
      other.description == description &&
      other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ id.hashCode;
}
