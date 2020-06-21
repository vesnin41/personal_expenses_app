import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  TransactionList({this.transactionsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.purple),
                  ),
                  child: Text(
                    "\$${transactionsList[index].amount}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 20.0),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactionsList[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Text(
                        DateFormat.yMMMMd()
                            .format(transactionsList[index].date),
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: transactionsList.length,
      ),
    );
  }
}
