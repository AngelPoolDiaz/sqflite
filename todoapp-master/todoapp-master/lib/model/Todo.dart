
class Todo {
  final int id;
  final String title;
  final String content;
 
  
  static const String TABLENAME = "todos";

  Todo({this.id,  this.title, this.content });

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content };
  }
}
