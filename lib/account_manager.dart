import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class AccountManager {
  final DataStorage dataStorage;

  AccountManager(this.dataStorage);

  int doCheckBalance(Account account) {
    return dataStorage.doCheckBalance(account);
  }

  void doTransfer(Account account) {
    dataStorage.doTransfer(account);
  }

  void doWithdraw(Account account) {
    dataStorage.doWithdraw(account);
  }

  void doAddBalance(Account account) {
    dataStorage.doAddBalance(account);
  }
}
