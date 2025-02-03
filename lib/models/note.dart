// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {

  final String title;
  final String body;
  final DateTime created;
  final String owner;

  Note({
    required this.title,
    required this.body,
    required this.created,
    required this.owner,
  });

  Note copyWith({
    String? title,
    String? body,
    DateTime? created,
    String? owner,
  }) {
    return Note(
      title: title ?? this.title,
      body: body ?? this.body,
      created: created ?? this.created,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'created': created.millisecondsSinceEpoch,
      'owner': owner,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      body: map['body'] as String,
      created: DateTime.now(),//parse(map['created']),
      owner: map['owner'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(title: $title, body: $body, created: $created, owner: $owner)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body &&
      other.created == created &&
      other.owner == owner;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      body.hashCode ^
      created.hashCode ^
      owner.hashCode;
  }

  static const testData = [
    {
      'title': "Test 1",
      'body': "Some test body",
      'created': '1/1/2025',
      'owner': 'Someone T-85'
    },
    {
      'title': "Test 2",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85'
    },
    {
      'title': "Test 3",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85'
    },
    {
      'title': "Test 4",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85'
    }
  ];

}
