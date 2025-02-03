// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {

  final String username;
  final String uuid;

  User({
    required this.username,
    required this.uuid,
  });

  User copyWith({
    String? username,
    String? uuid,
  }) {
    return User(
      username: username ?? this.username,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uuid': uuid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      uuid: map['uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(username: $username, uuid: $uuid)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.uuid == uuid;
  }

  @override
  int get hashCode => username.hashCode ^ uuid.hashCode;

  static const testData = [
    { 'username': "annoymous monkey 1", 'uuid': '11111111111'}
  ];

}
