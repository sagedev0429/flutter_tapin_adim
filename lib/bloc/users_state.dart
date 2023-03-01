// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

class UsersState extends Equatable {
  final ModelStatus status;
  final List<User> users;
  const UsersState({
    this.status = ModelStatus.initial,
    this.users = const <User>[],
  });

  @override
  List<Object> get props => [
        status,
        users,
      ];

  UsersState copyWith({
    ModelStatus? status,
    List<User>? users,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }
}

List<User> initialUsers = <User>[
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
  User(
    lastName: 'Adel',
    firstName: 'Devon',
    title: 'title',
    role: 'Site Admin',
    email: 'devon.adel@gmail.com',
    defaultSite: 'Raleigh',
    lastLogin: DateTime.now(),
    company: 'company1',
    active: true,
    hasMaster: false,
    invitedOn: DateTime.now(),
    notifications: 4,
    sites: [
      'Raleigh',
      'Durham',
      'New York and Japan',
    ],
  ),
];
