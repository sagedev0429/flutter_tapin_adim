import 'package:admin/repositories/audit_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/audit.dart';
import '../models/model.dart';

part 'audits_event.dart';
part 'audits_state.dart';

class AuditsBloc extends Bloc<AuditsEvent, AuditsState> {
  final AuditRepository auditRepository;
  AuditsBloc({
    required this.auditRepository,
  }) : super(const AuditsState()) {
    on<AuditsSubscriptionEvent>(_onAuditSubscription);
  }
  Future<void> _onAuditSubscription(
      AuditsSubscriptionEvent event, Emitter<AuditsState> emit) async {
    emit(
      state.copyWith(status: ModelStatus.loading),
    );
    try {
      final audits = await auditRepository.getAudits();
      emit(
        state.copyWith(audits: audits),
      );
      emit(
        state.copyWith(status: ModelStatus.succuess),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ModelStatus.failure),
      );
    }
  }
}
