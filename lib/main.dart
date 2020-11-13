import 'package:flutter/material.dart';
import 'package:my_expense/widgets/chart.dart';
import 'package:my_expense/widgets/new_transaction.dart';
import 'package:my_expense/widgets/transaction_list.dart';
import 'models/transaction.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "My Expense",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
          ),
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )))
        ),
        home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transaction> _userTransactions = [
    // Transaction(id: 't1',
    //     title: 'New Shoes',
    //     amount: 69.99,
    //     date: DateTime.now()
    // ),
    // Transaction(id: 't2',
    //     title: 'New Shirt',
    //     amount: 29.99,
    //     date: DateTime.now()
    // ),
    // Transaction(id: 't3',
    //     title: 'Weekly Tax',
    //     amount: 19.99,
    //     date: DateTime.now()
    // ),
  ];
  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tax){
      return tax.date.isAfter(
          DateTime.now().subtract(Duration(days: 7),));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar:AppBar(
          title: Text("My Expense"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: ()=>_startAddNewTransaction(context),

            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> _startAddNewTransaction(context)
          ,
        ),

      );

  }
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

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx,builder: (_){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );

    },backgroundColor: Colors.transparent);

  }

}

