import 'package:admin/repositories/observation_repository.dart';
import 'package:admin/screens/dashboard.dart';
import 'package:admin/screens/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/observations_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => ObservationRepository(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ObservationsBloc(
                observationRepository:
                    RepositoryProvider.of<ObservationRepository>(context),
              )..add(ObservatioinSubscriptionEvent()),
            ),
          ],
          child: const Layout(),
        ),
      ),
    );
  }
}
