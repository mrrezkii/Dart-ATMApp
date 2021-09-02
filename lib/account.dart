import 'package:meta/meta.dart';

class Account {
  final String username;
  final String password;
  final int balance;

  Account({@required this.username, @required this.password, this.balance = 0});
}
