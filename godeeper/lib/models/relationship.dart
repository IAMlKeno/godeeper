// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///
/// This class defines the definition of the relation between users.
class Relationship {

  final String uuid;
  final String keeper;
  final String keepee;

  Relationship({
    required this.uuid,
    required this.keeper,
    required this.keepee,
  });

  Relationship copyWith({
    String? uuid,
    String? keeper,
    String? keepee,
  }) {
    return Relationship(
      uuid: uuid ?? this.uuid,
      keeper: keeper ?? this.keeper,
      keepee: keepee ?? this.keepee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'keeper': keeper,
      'keepee': keepee,
    };
  }

  factory Relationship.fromMap(Map<String, dynamic> map) {
    return Relationship(
      uuid: map['uuid'] as String,
      keeper: map['keeper'] as String,
      keepee: map['keepee'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relationship.fromJson(String source) => Relationship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Relationship(uuid: $uuid, keeper: $keeper, keepee: $keepee)';

  @override
  bool operator ==(covariant Relationship other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.keeper == keeper &&
      other.keepee == keepee;
  }

  @override
  int get hashCode => uuid.hashCode ^ keeper.hashCode ^ keepee.hashCode;

}
