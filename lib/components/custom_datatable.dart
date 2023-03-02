import 'package:admin/models/filter.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:strings/strings.dart';
import '../models/model.dart';
import '../models/sort.dart';
import 'audit_status_badget.dart';
import 'observation_type_badge.dart';

class CustomDataTableScreen extends StatefulWidget {
  final String title;
  final List<Model> models;
  const CustomDataTableScreen(
      {super.key, required this.title, required this.models});

  @override
  State<CustomDataTableScreen> createState() => _CustomDataTableScreenState();
}

class _CustomDataTableScreenState extends State<CustomDataTableScreen> {
  List<SortItem> sortItems = [];
  List<FilterItem> filterItems = [];
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
  }

  void _showModal() {
    showModalSideSheet(
      width: MediaQuery.of(context).size.width * 1 / 3,
      barrierDismissible: true,
      context: context,
      ignoreAppBar: false,
      transitionDuration: const Duration(milliseconds: 200),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 200,
          horizontal: 100,
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          widget: widget,
          sortItems: sortItems,
          filterItems: filterItems,
        ),
        const SizedBox(
          height: 23,
        ),
        widget.models.isNotEmpty
            ? SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  rowsPerPage: rowsPerPage,
                  onRowsPerPageChanged: (value) => setState(() {
                    rowsPerPage = value!;
                  }),
                  columns: [
                    ...widget.models[0]
                        .visibleItemsToMap()
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
                    const DataColumn(
                      label: Text(''),
                    ),
                  ],
                  source: RowData(
                    models: widget.models,
                    showModal: _showModal,
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ],
    );
  }
}

class RowData extends DataTableSource {
  final List<Model> models;
  final VoidCallback showModal;

  RowData({
    required this.models,
    required this.showModal,
  });

  Widget _buildCell(dynamic entry) {
    if (entry is int) {
      return Text(
        (DateTime.fromMillisecondsSinceEpoch(entry)).toIso8601String(),
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      );
    } else if (entry is double) {
      return LinearProgressIndicator(
        backgroundColor: const Color(0xFFD9D9D9),
        color: const Color(0xFFB3B3B3),
        value: entry,
        minHeight: 32,
      );
    } else {
      if (entry is String) {
        if (entry.contains(
          RegExp(
            r'observation___[0-9]',
          ),
        )) {
          return ObservationTypeBadge(
            type: int.parse(
              entry.substring(
                entry.length - 1,
                entry.length,
              ),
            ),
          );
        } else if (entry.contains(
          RegExp(
            r'audit___[0-9]',
          ),
        )) {
          return AuditStatusBadge(
            status: int.parse(
              entry.substring(
                entry.length - 1,
                entry.length,
              ),
            ),
          );
        }
      }

      return Text(
        entry as String,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      );
    }
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => models.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    Map<String, dynamic> map = models[index].visibleItemsToMap();
    return DataRow(
      cells: [
        ...map.values.map(
          (entry) {
            return DataCell(
              _buildCell(entry),
              onTap: () => showModal(),
            );
          },
        ).toList(),
        DataCell(
          const Icon(
            Icons.keyboard_double_arrow_right,
          ),
          onTap: () => showModal(),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.widget,
    required this.sortItems,
    required this.filterItems,
  }) : super(key: key);

  final CustomDataTableScreen widget;
  final List<SortItem> sortItems;
  final List<FilterItem> filterItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            const SearchInput(),
            const SizedBox(
              width: 10,
            ),
            SortButton(
              sortItems: sortItems,
            ),
            const SizedBox(
              width: 10,
            ),
            FilterButton(
              filterItems: filterItems,
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
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
  FilterButton({
    Key? key,
    required this.filterItems,
  }) : super(key: key);

  final List<FilterItem> filterItems;
  final CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: filterItems
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _controller.hideMenu();
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.comparer.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.right,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
                ..add(
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _controller.hideMenu();
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        child: const Text('+ Add Filter'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: 0,
      controller: _controller,
      arrowColor: Colors.white,
      child: Container(
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
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  SortButton({
    Key? key,
    required this.sortItems,
  }) : super(key: key);

  final List<SortItem> sortItems;
  final CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: sortItems
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _controller.hideMenu();
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item.direction ? 'Des' : 'Asc',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
                ..add(
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _controller.hideMenu();
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        child: const Text('+ Add Sort'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: 0,
      arrowColor: Colors.white,
      enablePassEvent: true,
      controller: _controller,
      child: Container(
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
      ),
    );
  }
}
