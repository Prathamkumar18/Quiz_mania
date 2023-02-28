// ignore_for_file: public_member_api_docs, sort_constructors_first

 
class Question {
  final String id;
  final String title;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  
  @override
  String toString() => 'Question(id: $id, title: $title, options: $options)';

}
