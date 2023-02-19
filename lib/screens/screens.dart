import 'package:flutter/material.dart';

import 'action_items.dart';
import 'administration.dart';
import 'dashboard.dart';
import 'audits.dart';
import 'incidents.dart';
import 'observation.dart';
import 'permit_tracker.dart';
import 'reports.dart';
import 'workhours.dart';
import 'documentation.dart';
import 'traning_certs_screen.dart';

List<Widget> screens = const <Widget>[
  DashboardScreen(),
  ObservationScreen(),
  WorkHoursScreen(),
  IncidentsScreen(),
  ActionItemsScreen(),
  AuditsScreen(),
  DocumentationScreen(),
  TrainingCertsScreen(),
  PermitTrackerScreen(),
  ReportsScreen(),
  AdministrationScreen(),
];
