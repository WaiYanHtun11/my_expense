import 'package:flutter/material.dart';
import 'package:my_expense/models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
  List<Transaction> transactons;
  TransactionList(this.transactons);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactons.isEmpty || transactons == null ? Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('No transaction added yet!'),
          Container(
              height: 100,
              child: Image.asset('assets/images/dart.jpeg',fit: BoxFit.cover,))],
      ) : ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
            child: Row(
              children:<Widget> [
                Container(
                  child: Text(
                    '\$${transactons[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15
                  ),
                  decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2)),
                  padding: EdgeInsets.all(10),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactons[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactons[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactons.length,
      ),
    );
  }

}



