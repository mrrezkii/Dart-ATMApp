import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class AccountManager {
  final DataStorage dataStorage;

  AccountManager(this.dataStorage);

  int doCheckBalance(Account account) {
    return dataStorage.doCheckBalance(account);
  }

  void doTransfer(Account fromAcc, Account toAcc, int balance) {
    dataStorage.doTransfer(fromAcc, toAcc, balance);
  }

  void doWithdraw(Account account, int balance) {
    dataStorage.doWithdraw(account, balance);
  }

  void doAddBalance(Account account, int balance) {
    dataStorage.doAddBalance(account, balance);
  }
}
