import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../models/observation.dart';

class ObservationTypeBadge extends StatelessWidget {
  const ObservationTypeBadge({
    super.key,
    required this.type,
  });
  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == ObservationType.unsafe.index
            ? const Color(0xFFFFBABA)
            : const Color(0xFFCEF8C6),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 7,
      ),
      child: Text(
        capitalize(
          ObservationType.values[type].name,
        ),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
