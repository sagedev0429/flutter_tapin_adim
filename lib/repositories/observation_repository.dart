import 'package:admin/bloc/observations_bloc.dart';

import '../models/observation.dart';

class ObservationRepository {
  Future<List<Observation>> getObservations() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return initialObservations;
  }
}
