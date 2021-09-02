import 'package:atm_apps/account.dart';
import 'package:atm_apps/account_manager.dart';
import 'package:atm_apps/local_storage.dart';

void main(List<String> arguments) {
  var account1 = Account(username: 'rezki', password: '1234', balance: 10);
  var account2 = Account(username: 'nando', password: '1234', balance: 10);

  var accountManager = AccountManager(LocalStorage());

  print(accountManager.doCheckBalance(account2));
}
