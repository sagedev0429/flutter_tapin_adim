import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/Safety-Icon.png'),
                      const Text(
                        'PIMS Safety',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                    ]),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_left,
                    ))
              ],
            ),
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
            extended: true,
            destinations: const [
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
        ],
      ),
    );
  }
}
