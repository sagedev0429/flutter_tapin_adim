import 'package:admin/bloc/audits_bloc.dart';
import 'package:admin/bloc/theme/bloc/theme_bloc.dart';
import 'package:admin/bloc/users_bloc.dart';
import 'package:admin/repositories/audit_repository.dart';
import 'package:admin/repositories/observation_repository.dart';
import 'package:admin/repositories/user_repository.dart';

import 'package:admin/screens/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'bloc/observations_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHydratedLocalStorage();
  runApp(const MyApp());
}

setupHydratedLocalStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorage.webStorageDirectory);
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
          ),
          RepositoryProvider(
            create: (context) => AuditRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ObservationsBloc(
                observationRepository:
                    RepositoryProvider.of<ObservationRepository>(context),
              )..add(
                  ObservationsSubcriptionEvent(),
                ),
            ),
            BlocProvider(
              create: (context) => AuditsBloc(
                auditRepository:
                    RepositoryProvider.of<AuditRepository>(context),
              )..add(
                  AuditsSubscriptionEvent(),
                ),
            ),
            BlocProvider(
              create: (context) => UsersBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              )..add(UsersSubcriptionEvent()),
            ),
            BlocProvider(
              create: (context) => ThemeBloc(),
            ),
          ],
          child: const Layout(),
        ),
      ),
    );
  }
}
