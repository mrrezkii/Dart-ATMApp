import 'package:atm_apps/account.dart';
import 'package:atm_apps/data_storage.dart';

class LocalStorage implements DataStorage {
  static const FAILED_TRANSACTION =
      'Saldo Anda tidak mencukupi untuk melakukan transaksi';
  static const GETTING_ERROR =
      'Data yang Anda inputkan salah. Mohon input kembali';

  @override
  int doCheckBalance(Account account) {
    return account.balance;
  }

  @override
  bool doTransfer(Account fromAcc, Account toAcc, int balance) {
    try {
      if (balance <= fromAcc.balance) {
        var fromBalance = fromAcc.balance - balance;
        var toBalance = balance + toAcc.balance;
        fromAcc.balance = fromBalance;
        toAcc.balance = toBalance;

        return true;
      } else {
        print(FAILED_TRANSACTION);
      }
    } catch (e) {
      print(GETTING_ERROR);
    }

    return false;
  }

  @override
  bool doWithdraw(Account account, int balance) {
    try {
      if (balance <= account.balance) {
        var latestBalance = account.balance - balance;
        account.balance = latestBalance;

        return true;
      } else {
        print(FAILED_TRANSACTION);
      }
    } catch (e) {
      print(GETTING_ERROR);
    }

    return false;
  }

  @override
  bool doAddBalance(Account account, int balance) {
    try {
      var latestBalance = account.balance + balance;
      account.balance = latestBalance;
    } catch (e) {
      print(GETTING_ERROR);
    }

    return false;
  }
}
