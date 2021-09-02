import 'account.dart';

abstract class DataStorage {
  int doCheckBalance(Account account);
  void doTransfer(Account account);
  void doWithdraw(Account account);
  void doAddBalance(Account account);
}
