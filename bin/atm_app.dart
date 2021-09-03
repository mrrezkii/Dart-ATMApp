import 'dart:io';

import 'package:atm_apps/account.dart';
import 'package:atm_apps/account_manager.dart';
import 'package:atm_apps/local_storage.dart';

void main(List<String> arguments) {
  var account1 = Account(
      no_account: '0001', username: 'rezki', password: '1234', balance: 10000);
  var account2 = Account(
      no_account: '0002', username: 'nando', password: '1234', balance: 50000);
  var account3 =
      Account(no_account: '0003', username: 'kiki', password: '1234');

  var listAccount = [account1, account2, account3];
  var listNoAccount = listAccount.map((e) => e.no_account).toList();
  var listUsername = listAccount.map((e) => e.username).toList();
  var listPassword = listAccount.map((e) => e.password).toList();

  var accountManager = AccountManager(LocalStorage());

  print('''
  SELAMAT DATANG ATM BANK SOK JAGO
  ** LOGIN ***
     ''');
  print('Masukkan username Anda : ');
  var username = stdin.readLineSync();
  var usernameFound =
      (listUsername.contains(username)) ? listUsername.indexOf(username) : -1;

  print('Masukkan password Anda :');
  var password = stdin.readLineSync();

  var passwordValidation;
  try {
    passwordValidation =
        (listPassword[usernameFound] == password) ? true : false;
  } catch (e) {
    return;
  }

  if (passwordValidation) {
    var accountNumber = listAccount[usernameFound];

    print('''

    >> MENU YANG TERSEDIA
    1. Cek saldo
    2. Transfer
    3. Tarik Saldo
    4. Setor Tunai
    5. Log out
    ''');

    while (true) {
      print('Masukkan pilihan Anda  :');
      var option = int.tryParse(stdin.readLineSync());

      switch (option) {
        case 1:
          print('Sisa Saldo Anda sebesar : Rp' +
              accountManager.doCheckBalance(accountNumber).toString());
          break;
        case 2:
          print('Masukkan nomor rekening yang di tuju');
          var noAccount = stdin.readLineSync();
          var indexAccount = (listNoAccount.contains(noAccount))
              ? listNoAccount.indexOf(noAccount)
              : -1;

          if (indexAccount != -1) {
            print('Masukkan nominal yang akan di transfer :');
            var balance = int.tryParse(stdin.readLineSync());
            var success = accountManager.doTransfer(
                accountNumber, listAccount[indexAccount], balance);
            if (success) {
              print('Saldo berhasil di transfer');
              print('Total saldo Anda sekarang Rp' +
                  accountManager.doCheckBalance(accountNumber).toString());
            }
          } else {
            print('Nomor yang Anda masukkan salah');
          }
          break;
        case 3:
          print('Masukkan nominal yang ingin Anda tarik :');
          var balance = int.tryParse(stdin.readLineSync());
          var success = accountManager.doWithdraw(accountNumber, balance);
          if (success) {
            print('Saldo berhasil ditarik');
            print('Total saldo Anda sekarang Rp' +
                accountManager.doCheckBalance(accountNumber).toString());
          }
          break;
        case 4:
          print('Masukkan nominal yang ingin Anda setorkan :');
          var balance = int.tryParse(stdin.readLineSync());
          var success = accountManager.doAddBalance(accountNumber, balance);
          if (success) {
            print('Saldo berhasil ditambahkan');
            print('Total saldo Anda sekarang Rp' +
                accountManager.doCheckBalance(accountNumber).toString());
          }
          break;
        case 5:
          return;
          break;
        default:
          print('Anda memasukkan pilihan yang salah');
      }
    }
  } else {
    print('\nAkun Anda tidak ditemukan');
  }
}
