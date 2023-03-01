import 'package:flutter/material.dart';

import 'screens.dart';

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
  String selectedLocation = 'South East';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              NavigationRail(
                onDestinationSelected: (int index) {
                  setState(() {
                    if (index == 0) {
                      _selectedIndex = 1;
                    } else {
                      _selectedIndex = index;
                    }
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
                  ...screens.map(
                    (screen) => NavigationRailDestination(
                      icon: screen.icon,
                      label: screen.label,
                    ),
                  ),
                ],
                selectedIndex: _selectedIndex,
              ),
              Positioned(
                left: backButtonLeftPadding,
                top: 60,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF14130F),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color(0xFF14130F),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(),
                      Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Color(0xFFEFEEEC),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.notifications_on,
                              color: Color(0xFFEFEEEC),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xFFC8F5D2),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              'BE',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 28,
                    horizontal: 36,
                  ),
                  child: screens[_selectedIndex - 1].widget,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
