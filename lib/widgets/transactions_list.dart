import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  final Function deleteFunc;
  TransactionList({this.transactionsList, this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: transactionsList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      "assets/image/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text("\$${transactionsList[index].amount}")),
                      ),
                      radius: 30.0,
                    ),
                    title: Text(
                      transactionsList[index].title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "${DateFormat.yMMMd().format(transactionsList[index].date)}"),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteFunc(transactionsList[index].id);
                        }),
                  ),
                );
              },
              itemCount: transactionsList.length,
            ),
    );
  }
}
