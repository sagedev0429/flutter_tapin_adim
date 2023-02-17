import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum ObservationType { safe, unsafe }

class Observation {
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'type': type.index,
      'project': project,
      'company': company,
      'name': name,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Observation.fromMap(Map<String, dynamic> map) {
    return Observation(
      description: map['description'] as String,
      type: ObservationType.values[map['type'] as int],
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
