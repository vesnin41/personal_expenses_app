import 'package:flutter/material.dart';

class TransactionsAdd extends StatefulWidget {
  final Function addNewTransaction;

  TransactionsAdd({this.addNewTransaction});

  @override
  _TransactionsAddState createState() => _TransactionsAddState();
}

class _TransactionsAddState extends State<TransactionsAdd> {
  final TextEditingController _controllerTitle = TextEditingController();

  final TextEditingController _controllerAmount = TextEditingController();

  void submitData() {
    String submitTitle = _controllerTitle.text;
    double submitAmount = double.parse(_controllerAmount.text);

    if (submitTitle.isNotEmpty && submitAmount >= 0) {
      widget.addNewTransaction(submitTitle, submitAmount);
      _clear();
      Navigator.of(context).pop();
    }
  }

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
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: _controllerAmount,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                submitData();
              },
            )
          ],
        ),
      ),
    );
  }
}
