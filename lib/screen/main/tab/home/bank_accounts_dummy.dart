import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bank: bankShinhan, balance: 20000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bank: bankShinhan, balance: 100000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bank: bankShinhan, balance: 100000000, accountTypeName: '저축예금');
final bankAccountTtoss = BankAccount(bank: bankTtoss, balance: 100000000);
final bankAccountKakao = BankAccount(bank: bankKakao, balance: 3000000, accountTypeName: '입출금통장');

main() {
  //print(bankAccounts[0].accountTypeName);

  // List 출력
  for (final item in bankAccounts) {
    print(item.bank.name);
  }

  // Map 출력
  for (final entry in bankAccountsMap.entries) {
    print('${entry.key} : ${entry.value.accountTypeName ?? ''}');
  }

  // Set
  print(bankAccountsSet.contains(bankAccountShinhan1));

  print(bankAccounts.contains(bankAccountShinhan1));
}

// List
final List<BankAccount> bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountTtoss,
  bankAccountKakao,
];

// Map
final Map<String, BankAccount> bankAccountsMap = {
  'shinhan1': bankAccountShinhan1,
  'shinhan2': bankAccountShinhan2,
};

// Set
final Set<BankAccount> bankAccountsSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountTtoss,
  bankAccountKakao,
};
