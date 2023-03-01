// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'action_items.dart';
import 'administration.dart';
import 'audits.dart';
import 'dashboard.dart';
import 'documentation.dart';
import 'incidents.dart';
import 'observation.dart';
import 'permit_tracker.dart';
import 'reports.dart';
import 'traning_certs_screen.dart';
import 'users.dart';
import 'workhours.dart';

class SideBarItem {
  final Widget widget;
  final Widget label;
  final Widget icon;
  const SideBarItem({
    required this.widget,
    required this.label,
    required this.icon,
  });
}

List<SideBarItem> screens = const <SideBarItem>[
  SideBarItem(
    widget: DashboardScreen(),
    label: Text('Dashboard'),
    icon: Icon(Icons.dashboard),
  ),
  SideBarItem(
    widget: ObservationScreen(),
    label: Text('Observation'),
    icon: Icon(Icons.edit_note_outlined),
  ),
  SideBarItem(
    widget: WorkHoursScreen(),
    label: Text('Work hours'),
    icon: Icon(Icons.lock_clock),
  ),
  SideBarItem(
    widget: IncidentsScreen(),
    label: Text('Incidents'),
    icon: Icon(Icons.warning),
  ),
  SideBarItem(
    widget: ActionItemsScreen(),
    label: Text('Action Items'),
    icon: Icon(Icons.check_outlined),
  ),
  SideBarItem(
    widget: AuditsScreen(),
    label: Text('Audits'),
    icon: Icon(Icons.format_paint),
  ),
  SideBarItem(
    widget: DocumentationScreen(),
    label: Text('Documentation'),
    icon: Icon(Icons.document_scanner),
  ),
  SideBarItem(
    widget: TrainingCertsScreen(),
    label: Text('Training & Certs'),
    icon: Icon(Icons.hail_outlined),
  ),
  SideBarItem(
    widget: PermitTrackerScreen(),
    label: Text('Permit Tracker'),
    icon: Icon(Icons.perm_identity),
  ),
  SideBarItem(
    widget: ReportsScreen(),
    label: Text('Reports'),
    icon: Icon(Icons.bar_chart),
  ),
  SideBarItem(
    widget: AdministrationScreen(),
    label: Text('Administration'),
    icon: Icon(Icons.settings),
  ),
  SideBarItem(
    widget: UsersScreen(),
    label: Text('Users'),
    icon: Icon(Icons.people),
  ),
];
