import 'package:admin/components/custom_datatable.dart';
import 'package:admin/models/audit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strings/strings.dart';

import '../bloc/audits_bloc.dart';

class AuditsScreen extends StatefulWidget {
  const AuditsScreen({super.key});

  @override
  State<AuditsScreen> createState() => _AuditsScreenState();
}

class _AuditsScreenState extends State<AuditsScreen> {
  List<bool> selected = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuditsBloc, AuditsState>(
      listener: (context, state) {
        selected = List.generate(
          state.audits.length,
          (index) => false,
        );
      },
      builder: (context, state) {
        return CustomDataTableScreen(
          title: 'Audits',
          models: state.audits,
        );
      },
    );
  }
}

class AuditStatusBadge extends StatelessWidget {
  const AuditStatusBadge({
    super.key,
    required this.status,
  });
  final int status;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFFE4E4E4);
    switch (AuditStatus.values[status]) {
      case AuditStatus.draft:
        color = const Color(0xFFE4E4E4);
        break;
      case AuditStatus.complete:
        color = const Color(0xFFCEF8C6);
        break;
      case AuditStatus.review:
        color = const Color(0xFFD1ECFF);
        break;
      case AuditStatus.rejected:
        color = const Color(0xFFFFBABA);
        break;
      case AuditStatus.approved:
        color = const Color(0xFFEAE2FC);
        break;
      case AuditStatus.achieved:
        color = const Color(0xFFEDD1B7);
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 7,
      ),
      child: Text(
        capitalize(AuditStatus.values[status].name),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
