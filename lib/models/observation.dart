import 'dart:convert';

import 'model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum ObservationType { safe, unsafe }

class Observation extends Model {
  final String description;
  final ObservationType type;
  final String project;
  final String company;
  final String name;
  final DateTime date;
  Observation({
    required this.description,
    required this.type,
    required this.project,
    required this.company,
    required this.name,
    required this.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'type': 'observation___${type.index}',
      'project': project,
      'company': company,
      'name': name,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Observation.fromMap(Map<String, dynamic> map) {
    return Observation(
      description: map['description'] as String,
      type: ObservationType.values[int.parse(
        (map['type'] as String).replaceAll(
          'observation___',
          '',
        ),
      )],
      project: map['project'] as String,
      company: map['company'] as String,
      name: map['name'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Observation.fromJson(String source) =>
      Observation.fromMap(json.decode(source) as Map<String, dynamic>);
}
