// class Todo {
//   final int id;
//   final int userId;
//   final String title;
//   final bool completed;
//   Todo({
//     required this.id,
//     required this.title,
//     required this.userId,
//     required this.completed,
//   });
// }

class Todo {
  int? userId;
  int? id;
  String title;
  bool completed;

  Todo({this.userId, this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
