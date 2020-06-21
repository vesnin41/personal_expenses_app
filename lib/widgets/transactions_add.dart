import 'package:flutter/material.dart';

class TransactionsAdd extends StatelessWidget {
  final Function addNewTransaction;
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();

  TransactionsAdd({this.addNewTransaction});

  void _clear() {
    _controllerTitle.clear();
    _controllerAmount.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _controllerTitle,
              decoration: InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _controllerAmount,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                print('Added');
                addNewTransaction(_controllerTitle.text,
                    double.parse(_controllerAmount.text));
                _clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
