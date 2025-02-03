// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sermon {

  String uuid;
  String name;
  DateTime date;

  Sermon({
    required this.uuid,
    required this.name,
    required this.date,
  });

  Sermon copyWith({
    String? uuid,
    String? name,
    DateTime? date,
  }) {
    return Sermon(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Sermon.fromMap(Map<String, dynamic> map) {
    return Sermon(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      // date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      date: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sermon.fromJson(String source) => Sermon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Sermon(uuid: $uuid, name: $name, date: $date)';

  @override
  bool operator ==(covariant Sermon other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.name == name &&
      other.date == date;
  }

  @override
  int get hashCode => uuid.hashCode ^ name.hashCode ^ date.hashCode;

  static const testData = [
    {
      "uuid": "7741199c-c54b-4a4d-a79f-e3a96cc4b982",
      "name": "Sermon 1",
      "date": "1/1/2025",
    },
    {
      "uuid": "64975209-ea1e-4057-99f2-3c284a469e93",
      "name": "Sermon 2",
      "date": "1/1/2025",
    },
  ];

}
