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

  Widget _modalContainer(Map<String, dynamic> map) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObservationsBloc, ObservationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomDataTableScreen(
          title: 'Observations',
          models: state.observations,
          modalContainer: _modalContainer,
        );
      },
    );
  }
}
