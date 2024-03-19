// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final bool isvalid;
  final String uid;
  final String name;
  final String email;
  User({
    required this.isvalid,
    required this.uid,
    required this.name,
    required this.email,
  });

  User copyWith({
    bool? isvalid,
    String? uid,
    String? name,
    String? email,
  }) {
    return User(
      isvalid: isvalid ?? this.isvalid,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isvalid': isvalid,
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      isvalid: map['isvalid'] as bool,
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(isvalid: $isvalid, uid: $uid, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.isvalid == isvalid &&
      other.uid == uid &&
      other.name == name &&
      other.email == email;
  }

  @override
  int get hashCode {
    return isvalid.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      email.hashCode;
  }
}
