import 'package:flutter/material.dart';
import 'package:my_expense/models/transaction.dart';
import 'package:my_expense/widgets/transaction_list.dart';
import 'new_transaction.dart';
class UserTransition extends StatefulWidget {
  @override
  _UserTransitionState createState() => _UserTransitionState();
}

class _UserTransitionState extends State<UserTransition> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(id: 't2',
        title: 'New Shirt',
        amount: 29.99,
        date: DateTime.now()
    ),
    Transaction(id: 't3',
        title: 'Weekly Tax',
        amount: 19.99,
        date: DateTime.now()
    ),
  ];
  void _addNewTransaction(String title,double amount){
    final newTax = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id:DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTax);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
