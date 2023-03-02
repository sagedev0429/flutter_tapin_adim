import '../bloc/audits/audits_bloc.dart';

import '../models/audit.dart';

class AuditRepository {
  Future<List<Audit>> getAudits() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return initialAudits;
  }
}
