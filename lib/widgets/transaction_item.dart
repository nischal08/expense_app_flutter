import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class TransactionItem extends StatelessWidget {

  const TransactionItem({
    Key key,
    @required this.deleteTx,
    @required this.transaction,

  }) : super(key: key);

 
  final Function deleteTx;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all<Color>(
                //     Theme.of(context).errorColor,
                //   ),
                // ),
                onPressed: () => deleteTx(
                  transaction.id,
                ),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Delete',
                  style:
                      TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(
                  transaction.id,
                ),
                color: Theme.of(context).errorColor,
              ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
