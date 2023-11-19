import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactions
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Título'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Valor (R\$)'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    child: const Text('Nova Transação'),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
