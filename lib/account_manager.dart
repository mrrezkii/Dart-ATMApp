import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class AccountManager {
  final DataStorage dataStorage;

  AccountManager(this.dataStorage);

  int doCheckBalance(Account account) {
    return dataStorage.doCheckBalance(account);
  }

  bool doTransfer(Account fromAcc, Account toAcc, int balance) {
    return dataStorage.doTransfer(fromAcc, toAcc, balance);
  }

  bool doWithdraw(Account account, int balance) {
    return dataStorage.doWithdraw(account, balance);
  }

  bool doAddBalance(Account account, int balance) {
    return dataStorage.doAddBalance(account, balance);
  }
}
