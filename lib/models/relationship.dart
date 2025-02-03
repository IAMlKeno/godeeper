// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///
/// This class defines the definition of the relation between users.
class Relationship {

  final String uuid;
  final String user1;
  final String user2;

  Relationship({
    required this.uuid,
    required this.user1,
    required this.user2,
  });

  Relationship copyWith({
    String? uuid,
    String? user1,
    String? user2,
  }) {
    return Relationship(
      uuid: uuid ?? this.uuid,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'user1': user1,
      'user2': user2,
    };
  }

  factory Relationship.fromMap(Map<String, dynamic> map) {
    return Relationship(
      uuid: map['uuid'] as String,
      user1: map['user1'] as String,
      user2: map['user2'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relationship.fromJson(String source) => Relationship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Relationship(uuid: $uuid, user1: $user1, user2: $user2)';

  @override
  bool operator ==(covariant Relationship other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.user1 == user1 &&
      other.user2 == user2;
  }

  @override
  int get hashCode => uuid.hashCode ^ user1.hashCode ^ user2.hashCode;

}
