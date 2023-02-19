import 'package:admin/models/audit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strings/strings.dart';

import '../bloc/audits_bloc.dart';

class AuditsScreen extends StatefulWidget {
  const AuditsScreen({super.key});

  @override
  State<AuditsScreen> createState() => _AuditsScreenState();
}

class _AuditsScreenState extends State<AuditsScreen> {
  List<bool> selected = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuditsBloc, AuditsState>(
      listener: (context, state) {
        selected = List.generate(
          state.audits.length,
          (index) => false,
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Observations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 212,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFF545454),
                            ),
                            fillColor: const Color(0xFFD9D9D9),
                            filled: true,
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              color: Color(0xFF545454),
                            ),
                            contentPadding: const EdgeInsets.all(8)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        SortButton(
                          // sortItems: sortItems,
                          onClick: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(
                        // filterItems: filterItems,
                        ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ViewButton(),
                    const SizedBox(
                      width: 10,
                    ),
                    const NewButton(),
                    const SizedBox(
                      width: 10,
                    ),
                    const MoreButton(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            state.audits.isNotEmpty
                ? SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      showCheckboxColumn: true,
                      dividerThickness: 2,
                      columns: state.audits[0]
                          .toMap()
                          .keys
                          .map(
                            (key) => DataColumn(
                              label: Expanded(
                                child: Text(
                                  capitalize(key),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      rows: List.generate(
                        state.audits.length,
                        (index) => DataRow(
                          selected: selected[index],
                          onSelectChanged: (bool? value) {
                            setState(() {
                              selected[index] = value!;
                            });
                          },
                          cells: state.audits[index].toMap().values.map(
                            (entry) {
                              if (entry is int) {
                                if (entry < AuditStatus.values.length) {
                                  return DataCell(
                                    AuditStatusBadge(
                                      type: entry,
                                    ),
                                  );
                                } else {
                                  return DataCell(
                                    Text(
                                      (DateTime.fromMillisecondsSinceEpoch(
                                        entry,
                                      )).toIso8601String(),
                                    ),
                                  );
                                }
                              } else if (entry is double) {
                                return DataCell(
                                  LinearProgressIndicator(
                                    backgroundColor: const Color(0xFFD9D9D9),
                                    color: const Color(0xFFB3B3B3),
                                    value: entry,
                                    minHeight: 32,
                                  ),
                                );
                              } else {
                                return DataCell(Text(entry as String));
                              }
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}

class AuditStatusBadge extends StatelessWidget {
  const AuditStatusBadge({
    super.key,
    required this.type,
  });
  final int type;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFFE4E4E4);
    switch (AuditStatus.values[type]) {
      case AuditStatus.draft:
        color = const Color(0xFFE4E4E4);
        break;
      case AuditStatus.complete:
        color = const Color(0xFFCEF8C6);
        break;
      case AuditStatus.review:
        color = const Color(0xFFD1ECFF);
        break;
      case AuditStatus.rejected:
        color = const Color(0xFFFFBABA);
        break;
      case AuditStatus.approved:
        color = const Color(0xFFEAE2FC);
        break;
      case AuditStatus.achieved:
        color = const Color(0xFFEDD1B7);
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 7,
      ),
      child: Text(
        capitalize(AuditStatus.values[type].name),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 5,
      ),
      child: const Text(
        'View',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class NewButton extends StatelessWidget {
  const NewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF207BBD),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 7,
      ),
      child: const Text(
        'New',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      child: const Icon(
        Icons.more_horiz,
        size: 16,
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    // required this.filterItems,
  }) : super(key: key);

  // final List<ObservationFilterItem> filterItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 24,
        right: 18,
      ),
      child: Row(children: [
        const Text(
          'Filter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // filterItems.isNotEmpty
        //     ? Container(
        //         width: 24,
        //         height: 24,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: const Color(0xFF207BBD),
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: Text(
        //           filterItems.length.toString(),
        //           style: const TextStyle(
        //             color: Colors.white,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w700,
        //           ),
        //         ),
        //       )
        //     : Container()
      ]),
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    // required this.sortItems,
    required this.onClick,
  }) : super(key: key);

  // final List<ObservationSortItem> sortItems;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 24,
        right: 18,
      ),
      child: Row(children: [
        const Text(
          'Sort',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // sortItems.isNotEmpty
        //     ? Container(
        //         width: 24,
        //         height: 24,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: const Color(0xFF207BBD),
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: Text(
        //           sortItems.length.toString(),
        //           style: const TextStyle(
        //             color: Colors.white,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w700,
        //           ),
        //         ),
        //       )
        //     : Container()
      ]),
    );
  }
}
