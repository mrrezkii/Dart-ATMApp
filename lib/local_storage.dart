import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class LocalStorage implements DataStorage {
  @override
  int doCheckBalance(Account account) {
    return account.balance;
  }

  @override
  void doAddBalance(Account account, int balance) {
    try {
      var latestBalance = account.balance + balance;
      print("Saldo berhasil di tambah");
      print("total saldo sekarang " + latestBalance.toString());
    } catch (e) {
      print("Mohon input kembali");
    }
  }

  @override
  void doTransfer(Account fromAcc, Account toAcc, int balance) {
    try {
      if (balance <= fromAcc.balance) {
        var fromBalance = fromAcc.balance - balance;
        var toBalance = balance + toAcc.balance;
        print("Total saldo pentransfer" +
            fromAcc.username +
            " adalah " +
            fromBalance.toString());
        print("Total saldo penerima" +
            toAcc.username +
            " adalah " +
            toAcc.toString());
      }
    } catch (e) {
      print("Mohon input kembali");
    }
  }

  @override
  void doWithdraw(Account account, int balance) {
    try {
      var latestBalance = account.balance - balance;
      print("Saldo berhasil di tarik");
      print("total saldo sekarang " + latestBalance.toString());
    } catch (e) {
      print("Mohon input kembali");
    }
  }
}
