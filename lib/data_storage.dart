import 'account.dart';

abstract class DataStorage {
  int doCheckBalance(Account account);
  void doTransfer(Account fromAcc, Account toAcc, int balance);
  void doWithdraw(Account account, int balance);
  void doAddBalance(Account account, int balance);
}
