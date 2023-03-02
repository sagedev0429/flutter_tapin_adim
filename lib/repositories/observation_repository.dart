import '../models/observation.dart';

class ObservationRepository {
  Future<List<Observation>> getObservations() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return List.generate(
      100,
      (index) => Observation(
        company: 'Company$index',
        date: DateTime(2000),
        name: 'name$index',
        description: 'description$index',
        project: 'project$index',
        type: index % 3 == 0 ? ObservationType.safe : ObservationType.unsafe,
      ),
    );
  }
}
