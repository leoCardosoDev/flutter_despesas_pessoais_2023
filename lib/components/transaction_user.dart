import 'package:despesas_pessoais/components/transaction_from.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

   final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm()
      ],
    );
  }
}