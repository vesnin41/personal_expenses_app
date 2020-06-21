import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transactions_add.dart';
import '../widgets/transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New T-shirt',
      amount: 99.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String textTx, double amountTx) {
    Transaction newTransaction = Transaction(
        title: textTx,
        amount: amountTx,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsAdd(
          addNewTransaction: _addNewTransaction,
        ),
        TransactionList(
          transactionsList: transactions,
        ),
      ],
    );
  }
}
