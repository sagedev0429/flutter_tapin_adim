import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/observations_bloc.dart';
import '../components/custom_datatable.dart';

class ObservationScreen extends StatefulWidget {
  const ObservationScreen({super.key});

  @override
  State<ObservationScreen> createState() => _ObservationScreenState();
}

class _ObservationScreenState extends State<ObservationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObservationsBloc, ObservationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomDataTableScreen(
          title: 'Observations',
          models: state.observations,
        );
      },
    );
  }
}

class ObservationTypeBadge extends StatelessWidget {
  const ObservationTypeBadge({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == 'Unsafe'
            ? const Color(0xFFFFBABA)
            : const Color(0xFFCEF8C6),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 7,
      ),
      child: Text(
        type,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
