import 'dart:convert';

import 'model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AuditStatus { draft, complete, review, rejected, approved, achieved }

class Audit extends Model {
  final AuditStatus status;
  final String id;
  final String template;
  final String owner;
  final String site;
  final String project;
  final DateTime created;
  final double progress;
  Audit({
    required this.status,
    required this.id,
    required this.template,
    required this.owner,
    required this.site,
    required this.project,
    required this.created,
    required this.progress,
  });

  @override
  Map<String, dynamic> visibleItemsToMap() {
    return <String, dynamic>{
      'status': 'audit___${status.index}',
      'id': id,
      'template': template,
      'owner': owner,
      'site': site,
      'project': project,
      'created': created.millisecondsSinceEpoch,
      'progress': progress,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': 'audit___${status.index}',
      'id': id,
      'template': template,
      'owner': owner,
      'site': site,
      'project': project,
      'created': created.millisecondsSinceEpoch,
      'progress': progress,
    };
  }

  factory Audit.fromMap(Map<String, dynamic> map) {
    return Audit(
      status: AuditStatus.values[int.parse(
        (map['status'] as String).replaceAll(
          'audit___',
          '',
        ),
      )],
      id: map['id'] as String,
      template: map['template'] as String,
      owner: map['owner'] as String,
      site: map['site'] as String,
      project: map['project'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      progress: map['progress'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Audit.fromJson(String source) =>
      Audit.fromMap(json.decode(source) as Map<String, dynamic>);

  Audit copyWith({
    AuditStatus? status,
    String? id,
    String? template,
    String? owner,
    String? site,
    String? project,
    DateTime? created,
    double? progress,
  }) {
    return Audit(
      status: status ?? this.status,
      id: id ?? this.id,
      template: template ?? this.template,
      owner: owner ?? this.owner,
      site: site ?? this.site,
      project: project ?? this.project,
      created: created ?? this.created,
      progress: progress ?? this.progress,
    );
  }
}
