import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:admin/screens/dashboard.dart';
import 'package:admin/screens/observation.dart';

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
              Positioned(
                left: backButtonLeftPadding,
                top: 60,
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                      Row(
                        children: [
                          // DropdownButtonHideUnderline(
                          //   child: DropdownButton2(
                          //     buttonDecoration: BoxDecoration(
                          //       color: const Color(0xFF2B2A25),
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     hint: Text(
                          //       'Select Item',
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //         color: Theme.of(context).hintColor,
                          //       ),
                          //     ),
                          //     value: Row(
                          //       children: const [
                          //         Icon(
                          //           Icons.location_pin,
                          //           color: Color(0xFFA3A2A1),
                          //         ),
                          //         SizedBox(
                          //           width: 9,
                          //         ),
                          //         Text(
                          //           'South East',
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.w700,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     icon: const Icon(
                          //       Icons.keyboard_arrow_down,
                          //       color: Color(0xFFA3A2A1),
                          //     ),
                          //     items: [
                          //       DropdownMenuItem(
                          //         value: Row(
                          //           children: const [
                          //             Icon(
                          //               Icons.location_pin,
                          //               color: Color(0xFFA3A2A1),
                          //             ),
                          //             SizedBox(
                          //               width: 9,
                          //             ),
                          //             Text(
                          //               'South East',
                          //               style: TextStyle(
                          //                 fontSize: 16,
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         enabled: true,
                          //         child: Row(
                          //           children: const [
                          //             Icon(
                          //               Icons.location_pin,
                          //               color: Color(0xFFA3A2A1),
                          //             ),
                          //             SizedBox(
                          //               width: 9,
                          //             ),
                          //             Text(
                          //               'South East',
                          //               style: TextStyle(
                          //                 fontSize: 16,
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //     onChanged: (value) {
                          //       setState(() {
                          //         selectedLocation = value as String;
                          //       });
                          //     },
                          //     buttonHeight: 36,
                          //     buttonWidth: 161,
                          //     itemHeight: 36,
                          //   ),
                          // ),
                        ],
                      ),
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
                  child: screens[_selectedIndex - 1],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
