import 'package:admin/models/observation.dart';
import 'package:admin/models/observation_filter.dart';
import 'package:admin/models/observation_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strings/strings.dart';

import '../bloc/observations_bloc.dart';

class ObservationScreen extends StatefulWidget {
  const ObservationScreen({super.key});

  @override
  State<ObservationScreen> createState() => _ObservationScreenState();
}

class _ObservationScreenState extends State<ObservationScreen> {
  List<ObservationSortItem> sortItems = [];
  List<ObservationFilterItem> filterItems = [];
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = List.generate(
        context.read<ObservationsBloc>().state.observations.length,
        (index) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObservationsBloc, ObservationsState>(
      listener: (context, state) {
        selected = List.generate(
          state.observations.length,
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
                          sortItems: sortItems,
                          onClick: () {},
                        ),
                        // Positioned(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       border: Border.all(
                        //         color: Colors.black,
                        //         width: 2,
                        //       ),
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     child: ListView.builder(
                        //       itemCount: sortItems.length + 1,
                        //       itemBuilder: (context, index) {
                        //         if (index == sortItems.length) {
                        //           return ElevatedButton(
                        //             child: Text('+ Add Sort'),
                        //             onPressed: () {},
                        //           );
                        //         }
                        //         return SizedBox(
                        //           height: 100,

                        //           child: Row(
                        //             children: [
                        //               IconButton(
                        //                 onPressed: () {},
                        //                 icon: Row(
                        //                   children: const [
                        //                     Icon(Icons.more_vert),
                        //                     Icon(Icons.more_vert),
                        //                   ],
                        //                 ),
                        //               ),
                        //               DropdownButton(
                        //                   items: [], onChanged: ((value) {}))
                        //             ],
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(filterItems: filterItems),
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
            state.observations.isNotEmpty
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
                      columns: state.observations[0]
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
                        state.observations.length,
                        (index) => DataRow(
                          selected: selected[index],
                          onSelectChanged: (bool? value) {
                            setState(() {
                              selected[index] = value!;
                            });
                          },
                          cells: state.observations[index].toMap().values.map(
                            (entry) {
                              if (entry is int) {
                                if (entry < ObservationType.values.length) {
                                  return DataCell(
                                    ObservationTypeBadge(
                                      type: entry == ObservationType.safe.index
                                          ? 'Safe'
                                          : 'Unsafe',
                                    ),
                                  );
                                } else {
                                  return DataCell(
                                    Text(
                                      (DateTime.fromMillisecondsSinceEpoch(
                                              entry))
                                          .toIso8601String(),
                                    ),
                                  );
                                }
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

class ObservationTypeBadge extends StatelessWidget {
  const ObservationTypeBadge({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == 'Unsafe'
            ? const Color(0xFFFFBABA)
            : const Color(0xFFCEF8C6),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 7,
      ),
      child: Text(
        type,
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
    required this.filterItems,
  }) : super(key: key);

  final List<ObservationFilterItem> filterItems;

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
        filterItems.isNotEmpty
            ? Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF207BBD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  filterItems.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : Container()
      ]),
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    required this.sortItems,
    required this.onClick,
  }) : super(key: key);

  final List<ObservationSortItem> sortItems;
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
        sortItems.isNotEmpty
            ? Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF207BBD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  sortItems.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : Container()
      ]),
    );
  }
}
