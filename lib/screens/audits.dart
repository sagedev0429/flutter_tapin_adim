import 'package:admin/components/custom_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

