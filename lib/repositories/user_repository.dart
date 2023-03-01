import '../bloc/users_bloc.dart';
import '../models/user.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return initialUsers;
  }
}
