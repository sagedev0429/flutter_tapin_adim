import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/bloc/theme_bloc.dart';
import 'screens.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // String backButtonType = 'back';
  // double backButtonLeftPadding = 30;
  String selectedLocation = 'South East';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Row(
            children: [
              Stack(
                children: [
                  NavigationRail(
                    onDestinationSelected: (int index) {
                      if (index == 0) {
                        context
                            .read<ThemeBloc>()
                            .add(const ThemeMenuSelected(menuIndex: 1));
                      } else {
                        context
                            .read<ThemeBloc>()
                            .add(ThemeMenuSelected(menuIndex: index));
                      }
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
                    extended: state.isMenuExtended,
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
                    selectedIndex: state.menuIndex,
                  ),
                  Positioned(
                    left: state.isMenuExtended ? 200 : 30,
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
                        child: Image.asset(
                            'images/${state.isMenuExtended ? 'back' : 'forward'}.png'),
                      ),
                      onTap: () {
                        context.read<ThemeBloc>().add(
                              ThemeMenuCollpased(
                                  isMenuExtended: !state.isMenuExtended),
                            );
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
                      child: screens[state.menuIndex - 1].widget,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
