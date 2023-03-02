import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';
import '../components/custom_datatable.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _modalContainer(Map<String, dynamic> map) {
    final keys = map.keys.toList();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 100,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: const Text(
              'User Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) => ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keys[index]),
                    Text(
                      map[keys[index]],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomDataTableScreen(
          title: 'Users',
          models: state.users,
          modalContainer: _modalContainer,
        );
      },
    );
  }
}
