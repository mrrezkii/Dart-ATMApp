import 'package:meta/meta.dart';

class Account {
  static const ERROR = 'Kamu harus login dengan akun yang tersedia';

  String no_account;
  String username;
  String password;
  int balance;

  Account(
      {@required this.no_account,
      @required this.username,
      @required this.password,
      this.balance = 0}) {
    assert(username != null || password != null, ERROR);
  }
}
