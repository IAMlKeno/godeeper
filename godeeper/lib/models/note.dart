// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:godeeper/models/tag.dart';

class Note {

  final String uuid;
  final String title;
  final String body;
  final DateTime created;
  final String owner;
  final List<Tag>? tags;
  final String? sermon;

  Note({
    required this.uuid,
    required this.title,
    required this.body,
    required this.created,
    required this.owner,
    this.tags,
    this.sermon,
  });

  Note copyWith({
    String? uuid,
    String? title,
    String? body,
    DateTime? created,
    String? owner,
    List<Tag>? tags,
    String? sermon,
  }) {
    return Note(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      body: body ?? this.body,
      created: created ?? this.created,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
      sermon: sermon ?? this.sermon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'title': title,
      'body': body,
      'created': created.millisecondsSinceEpoch,
      'owner': owner,
      'tags': tags,
      'sermon': sermon,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      uuid: map['uuid'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      created: DateTime.now(),//parse(map['created']),
      owner: map['owner'] as String,
      tags: map['tags'] != null
          ? List<Tag>.from(map['tags']!.map((e) => Tag.fromMap(e)))
          : [],
      sermon: map['sermon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(uuid: $uuid, title: $title, body: $body, created: $created, owner: $owner, sermon: $sermon)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.title == title &&
      other.body == body &&
      other.created == created &&
      other.owner == owner &&
      other.sermon == sermon;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
      title.hashCode ^
      body.hashCode ^
      created.hashCode ^
      sermon.hashCode ^
      owner.hashCode;
  }

  static const testData = [
    {
      'uuid': "65679548-38db-48d7-832a-4ce3babd8fe0",
      'title': "Test 1",
      'body': "Some test body",
      'created': '1/1/2025',
      'owner': 'Someone T-85',
      'tags': [
        {"uuid": '', 'name': 'healing'},
        {"uuid": '', 'name': 'courage'},
      ],
      'sermon': '7741199c-c54b-4a4d-a79f-e3a96cc4b982'
    },
    {
      'uuid': "e465266f-75c0-483c-befa-bd52687b44a3",
      'title': "Test 2",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85',
      'sermon': '64975209-ea1e-4057-99f2-3c284a469e93'
    },
    {
      'uuid': "94f2e586-24ac-4adf-8831-a4317daef90c",
      'title': "Test 3",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85',
      'sermon': '7741199c-c54b-4a4d-a79f-e3a96cc4b982'
    },
    {
      'uuid': "29fe950f-40a0-4a2d-b7d5-7eb5324ff828",
      'title': "Test 4",
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'created': '1/1/2025',
      'owner': 'Someone T-85',
      'sermon': '7741199c-c54b-4a4d-a79f-e3a96cc4b982'
    }
  ];

}
