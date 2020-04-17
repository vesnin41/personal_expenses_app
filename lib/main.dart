import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpensesApp(),
    );
  }
}

class ExpensesApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpensesApp'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Text('Card1'),
              ),
              elevation: 5,
              color: Colors.blue,
            ),
            Card(
              child: Text('Card2'),
              color: Colors.red,
            ),
            Column(
              children: transactions
                  .map((tr) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: Colors.purple),
                              ),
                              child: Text(
                                tr.amount.toString(),
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
                                    tr.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    tr.date.toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
