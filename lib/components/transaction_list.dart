import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
                children: transactions
                    .map((tr) => Card(
                          elevation: 5,
                          child: Row(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.purple,
                              )),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'R\$ ${tr.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tr.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM y').format(tr.date),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            )
                          ]),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
