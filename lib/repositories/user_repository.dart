import '../models/user.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return List<User>.generate(
      100,
      (index) => User(
        lastName: 'Adel$index',
        firstName: 'Devon$index',
        title: 'title$index',
        role: 'Site Admin$index',
        email: 'devon.adel$index@gmail.com',
        defaultSite: 'Raleigh$index',
        lastLogin: DateTime.now(),
        company: 'company$index',
        active: index % 3 == 0 ? true : false,
        hasMaster: index % 4 == 0 ? true : false,
        invitedOn: DateTime.now(),
        notifications: 4,
        sites: [
          'Raleigh$index',
          'Durham$index',
          'New York and Japan$index',
        ],
      ),
    );
  }
}
