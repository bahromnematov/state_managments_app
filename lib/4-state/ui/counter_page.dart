import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managments_app/4-state/controller/counter_controller.dart';

import 'first_page.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Conter Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Obx(() => Text(
                  controller.count.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => controller.decrement(),
                    child: Text("Decrement")),
                TextButton(
                    onPressed: () => controller.increment(),
                    child: Text("Increment")),
              ],
            ),
            IconButton(
                onPressed: () => Get.to(FirstPage()),
                icon: Icon(Icons.skip_next))
          ],
        ),
      ),
    );
  }
}
