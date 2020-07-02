import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsAdd extends StatefulWidget {
  final Function addNewTransaction;

  TransactionsAdd({this.addNewTransaction});

  @override
  _TransactionsAddState createState() => _TransactionsAddState();
}

class _TransactionsAddState extends State<TransactionsAdd> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {
    if (_controllerAmount.text.isEmpty) {
      return;
    }
    String submitTitle = _controllerTitle.text;
    double submitAmount = double.parse(_controllerAmount.text);

    if (submitTitle.isEmpty || submitAmount < 0 || _pickedDate == null) {
      return;
    }

    widget.addNewTransaction(submitTitle, submitAmount, _pickedDate);
    _clear();
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _pickedDate = value;
      });
    });
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
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              controller: _controllerAmount,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_pickedDate == null
                      ? "No Date Choosen!"
                      : "Picked Date: ${DateFormat.yMd().format(_pickedDate)}"),
                ),
                FlatButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    "Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
              ),
              onPressed: () {
                _submitData();
              },
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
            )
          ],
        ),
      ),
    );
  }
}
