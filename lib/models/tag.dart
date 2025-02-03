// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tag {

  String uuid;
  String name;

  Tag({
    required this.uuid,
    required this.name,
  });

  Tag copyWith({
    String? uuid,
    String? name,
  }) {
    return Tag(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) => Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tag(uuid: $uuid, name: $name)';

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.name == name;
  }

  @override
  int get hashCode => uuid.hashCode ^ name.hashCode;

  static const testData = [
    {
      "uuid": "",
      "name": "healing"
    }
  ];

}
