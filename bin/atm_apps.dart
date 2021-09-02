import 'package:atm_apps/account.dart';
import 'package:atm_apps/account_manager.dart';
import 'package:atm_apps/local_storage.dart';

void main(List<String> arguments) {
  var account1 = Account(username: 'rezki', password: '1234', balance: 50000);
  var account2 = Account(username: 'nando', password: '1234', balance: 125000);

  var accountManager = AccountManager(LocalStorage());

  print(accountManager.doCheckBalance(account1));
  print(accountManager.doCheckBalance(account2));

  accountManager.doTransfer(account1, account2, 20000);
  accountManager.doTransfer(account2, account1, 20000);
  accountManager.doTransfer(account1, account2, 100000000000);

  accountManager.doWithdraw(account1, 2000);
  accountManager.doWithdraw(account2, 2000);
  accountManager.doWithdraw(account2, 100000000000);

  accountManager.doAddBalance(account1, 1000000);
  accountManager.doAddBalance(account2, 1500000);
}
