import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_view_model.dart';

class ProviderCounter extends StatefulWidget {
  const ProviderCounter({Key? key}) : super(key: key);

  @override
  State<ProviderCounter> createState() => _ProviderCounterState();
}

class _ProviderCounterState extends State<ProviderCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sen shuncha marta FABni bosding"),
            Text(
              "${context.watch<CounterViewModel>().count}",
              style: const TextStyle(fontSize: 28),
            ),
            IconButton(
                onPressed: () {
                  context.read<CounterViewModel>().decrement();
                },
                icon: Icon(Icons.map))
          ],
        ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterViewModel>().increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
    );
  }
}
