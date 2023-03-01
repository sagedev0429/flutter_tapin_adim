// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'model.dart';

class User extends Model {
  final String lastName;
  final String firstName;
  final String title;
  final String role;
  final String email;
  final String defaultSite;
  final DateTime lastLogin;
  final String company;
  final bool active;
  final bool hasMaster;
  final DateTime invitedOn;
  final int notifications;
  final List<String> sites;
  User({
    required this.lastName,
    required this.firstName,
    required this.title,
    required this.role,
    required this.email,
    required this.defaultSite,
    required this.lastLogin,
    required this.company,
    required this.active,
    required this.hasMaster,
    required this.invitedOn,
    required this.notifications,
    required this.sites,
  });

  @override
  Map<String, dynamic> visibleItemsToMap() {
    return <String, dynamic>{
      'lastName': lastName,
      'firstName': firstName,
      'title': title,
      'role': role,
      'email': email,
      'defaultSite': defaultSite,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastName': lastName,
      'firstName': firstName,
      'title': title,
      'role': role,
      'email': email,
      'defaultSite': defaultSite,
      'lastLogin': lastLogin.millisecondsSinceEpoch,
      'company': company,
      'active': active,
      'hasMaster': hasMaster,
      'invitedOn': invitedOn.millisecondsSinceEpoch,
      'notifications': notifications,
      'sites': sites,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      title: map['title'] as String,
      role: map['role'] as String,
      email: map['email'] as String,
      defaultSite: map['defaultSite'] as String,
      lastLogin: DateTime.fromMillisecondsSinceEpoch(map['lastLogin'] as int),
      company: map['company'] as String,
      active: map['active'] as bool,
      hasMaster: map['hasMaster'] as bool,
      invitedOn: DateTime.fromMillisecondsSinceEpoch(map['invitedOn'] as int),
      notifications: map['notifications'] as int,
      sites: List<String>.from((map['sites'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? lastName,
    String? firstName,
    String? title,
    String? role,
    String? email,
    String? defaultSite,
    DateTime? lastLogin,
    String? company,
    bool? active,
    bool? hasMaster,
    DateTime? invitedOn,
    int? notifications,
    List<String>? sites,
  }) {
    return User(
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      title: title ?? this.title,
      role: role ?? this.role,
      email: email ?? this.email,
      defaultSite: defaultSite ?? this.defaultSite,
      lastLogin: lastLogin ?? this.lastLogin,
      company: company ?? this.company,
      active: active ?? this.active,
      hasMaster: hasMaster ?? this.hasMaster,
      invitedOn: invitedOn ?? this.invitedOn,
      notifications: notifications ?? this.notifications,
      sites: sites ?? this.sites,
    );
  }
}
