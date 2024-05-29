import 'package:product_inventory/data/users.dart';
import 'package:product_inventory/models/user.dart';

class UserService {
  List<User> index({String? search}) {
    if (search != null) {
      return users
          .where(
              (user) => user.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    } else {
      return users;
    }
  }

  Future<User?> login(String email, String password) async {
    User? verifiedUser;

    // check user is valid
    for (final user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return verifiedUser;
  }

  Future<int> register(
    String email,
    String name,
    String password,
    String passwordConfirm,
    String phoneNumber,
  ) async {
    int registrationResponse = 400;

    // check input is valid
    if (email.isEmpty ||
        name.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty) {
      registrationResponse = 400;
      return registrationResponse;
    } else if (password != passwordConfirm) {
      registrationResponse = 422;
      return registrationResponse;
    } else {
      // check user is exist
      for (final user in users) {
        if (user.email == email || user.name == name) {
          registrationResponse = 409;
          return registrationResponse;
        }
      }

      // create new user
      final User user = User(
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber,
      );

      users.add(user);
      registrationResponse = 200;
    }

    return registrationResponse;
  }
}
