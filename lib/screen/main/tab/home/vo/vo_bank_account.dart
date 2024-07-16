import 'vo_bank.dart';

class BankAccount {
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount({required this.bank, required this.balance, this.accountTypeName});
}
