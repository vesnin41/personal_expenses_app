import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpensesApp'),
      ),
      body: SingleChildScrollView(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Card1'),
                elevation: 3,
                color: Colors.blue,
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
