class UserService {
  Future<bool> login(String email, String password) async {
    bool isVerified = false;

    if (email == 'doni.duaasattuu@gmail.com' && password == 'a') {
      return true;
    } else if (email == 'shintiakartikasari22@gmail.com' &&
        password == 'rahasia') {
      return true;
    } else if (email == 'anggigitacahyani@gmail.com' && password == 'rahasia') {
      return true;
    } else if (email == 'tiaraanggreani@gmail.com' && password == 'rahasia') {
      return true;
    } else {
      return isVerified;
    }
  }
}
