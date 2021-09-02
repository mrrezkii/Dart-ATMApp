import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class LocalStorage implements DataStorage {
  @override
  void doAddBalance(Account account) {
    // TODO: implement doAddBalance
  }

  @override
  void doTransfer(Account account) {
    // TODO: implement doTransfer
  }

  @override
  void doWithdraw(Account account) {
    // TODO: implement doWithdraw
  }

  @override
  int doCheckBalance(Account account) {
    return account.balance;
  }
}
