// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'audits_bloc.dart';

class AuditsState extends Equatable {
  final List<Audit> audits;
  final ModelStatus status;

  const AuditsState({
    this.audits = const [],
    this.status = ModelStatus.initial,
  });

  @override
  List<Object> get props => [
        audits,
        status,
      ];

  AuditsState copyWith({
    List<Audit>? audits,
    ModelStatus? status,
  }) {
    return AuditsState(
      audits: audits ?? this.audits,
      status: status ?? this.status,
    );
  }
}

List<Audit> initialAudits = <Audit>[
  Audit(
    status: AuditStatus.achieved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.7,
  ),
  Audit(
    status: AuditStatus.complete,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.4,
  ),
  Audit(
    status: AuditStatus.achieved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.1,
  ),
  Audit(
    status: AuditStatus.achieved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.4,
  ),
  Audit(
    status: AuditStatus.approved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.3,
  ),
  Audit(
    status: AuditStatus.draft,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.2,
  ),
  Audit(
    status: AuditStatus.rejected,
    id: '123456',
    template: 'template1',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.9,
  ),
  Audit(
    status: AuditStatus.rejected,
    id: '123456',
    template: 'template1',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.4,
  ),
  Audit(
    status: AuditStatus.achieved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.8,
  ),
  Audit(
    status: AuditStatus.approved,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.2,
  ),
  Audit(
    status: AuditStatus.draft,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.3,
  ),
  Audit(
    status: AuditStatus.complete,
    id: '123456',
    template: 'template',
    owner: 'owner',
    site: 'site',
    project: 'project',
    created: DateTime.now(),
    progress: 0.5,
  ),
];
