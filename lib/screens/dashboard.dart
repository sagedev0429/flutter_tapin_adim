import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFFE3E2E1),
                    child: const Text(
                      "Data viz graphic",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFFE3E2E1),
                    child: const Text(
                      "Data viz graphic",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFFE3E2E1),
                    child: const Text(
                      "To do",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Container(
                    height: 380,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFFE3E2E1),
                    child: const Text(
                      "Activity Feed",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
