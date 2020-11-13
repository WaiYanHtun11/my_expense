import 'package:flutter/material.dart';
class NewTransaction extends StatefulWidget {
  final Function addTax;
  NewTransaction(this.addTax);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
      widget.addTax(enteredTitle,enteredAmount);
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:Container(
        padding: EdgeInsets.all(5),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged:(value){
              //this.titleInput = value;
              //} ,
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_)=>submitData(),

            ),
            TextField(decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value){
              // this.amountInput = value;
              //},
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
