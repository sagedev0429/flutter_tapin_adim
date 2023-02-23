import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../models/audit.dart';

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
