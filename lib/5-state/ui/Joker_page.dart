import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:state_managments_app/5-state/controller/jokes_controller.dart';

class JokerPage extends StatelessWidget {
  const JokerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JokesController controller = Get.put(JokesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Joker Page"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: controller.jokes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    title: Text(controller.jokes[index].setup),
                    subtitle: Text(controller.jokes[index].punchline),
                  )
          );
        }
      }
      ),
    );
  }
}
