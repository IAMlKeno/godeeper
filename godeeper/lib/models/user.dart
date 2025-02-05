// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {

  final String funnyName;
  final String username;
  final String uuid;

  User({
    required this.funnyName,
    required this.username,
    required this.uuid,
  });

  User copyWith({
    String? funnyName,
    String? username,
    String? uuid,
  }) {
    return User(
      funnyName: funnyName ?? this.funnyName,
      username: username ?? this.username,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'funnyName': funnyName,
      'username': username,
      'uuid': uuid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      funnyName: map['funnyName'] as String,
      username: map['username'] as String,
      uuid: map['uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(funnyName: $funnyName, username: $username, uuid: $uuid)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.funnyName == funnyName &&
      other.username == username &&
      other.uuid == uuid;
  }

  @override
  int get hashCode => funnyName.hashCode ^ username.hashCode ^ uuid.hashCode;

  static const testData = [
    { 'funnyName': 'funnymonkey28', 'username': "annoymous monkey 1", 'uuid': '11111111111'},
    { 'funnyName': 'anaolousconfortti', 'username': "annoymous monkey 1", 'uuid': '11111111111'},
  ];

}
