import 'account.dart';

abstract class DataStorage {
  int doCheckBalance(Account account);
  bool doTransfer(Account fromAcc, Account toAcc, int balance);
  bool doWithdraw(Account account, int balance);
  bool doAddBalance(Account account, int balance);
}
