import 'package:flutter/material.dart';

class DefoultCounter extends StatefulWidget {
  const DefoultCounter({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DefoultCounter> createState() => _DefoultCounterState();
}

class _DefoultCounterState extends State<DefoultCounter> {
    int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next_sharp))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
