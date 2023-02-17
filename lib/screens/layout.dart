import 'package:admin/screens/dashboard.dart';
import 'package:admin/screens/observation.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 1;
  bool _isExtended = true;
  String backButtonType = 'back';
  double backButtonLeftPadding = 200;
  List<Widget> screens = const <Widget>[DashboardScreen(), ObservationScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              Container(
                child: NavigationRail(
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  backgroundColor: const Color(0xFF14130F),
                  unselectedIconTheme: const IconThemeData(
                    color: Color(0xFFA3A2A1),
                  ),
                  unselectedLabelTextStyle: const TextStyle(
                    color: Color(0xFFA3A2A1),
                  ),
                  selectedIconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  extended: _isExtended,
                  destinations: [
                    NavigationRailDestination(
                      icon: Image.asset('images/Safety-Icon.png'),
                      label: const Text(
                        'PIMS Safety',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.dashboard,
                      ),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.edit_note_outlined,
                      ),
                      label: Text('Observation'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.lock_clock,
                      ),
                      label: Text('Work hours'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.warning,
                      ),
                      label: Text('Incidents'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.check_outlined,
                      ),
                      label: Text('Action Items'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.format_paint,
                      ),
                      label: Text('Audits'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.document_scanner,
                      ),
                      label: Text('Documentation'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.hail_outlined,
                      ),
                      label: Text('Training & Certs'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.perm_identity,
                      ),
                      label: Text('Permit Tracker'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.bar_chart,
                      ),
                      label: Text('Reports'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.settings,
                      ),
                      label: Text('Administration'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                ),
              ),
              Positioned(
                left: backButtonLeftPadding,
                top: 60,
                child: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset('images/$backButtonType.png'),
                  ),
                  onTap: () {
                    setState(() {
                      _isExtended = !_isExtended;
                      backButtonLeftPadding =
                          backButtonLeftPadding == 200 ? 30 : 200;
                      backButtonType =
                          backButtonType == 'back' ? 'forward' : 'back';
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  screens[_selectedIndex - 1],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
