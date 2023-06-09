import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:state_managments_app/2-state/view_model/products_view_model.dart';
import 'package:state_managments_app/3-state/view_model/minds_view_model.dart';
import 'package:state_managments_app/5-state/ui/Joker_page.dart';

import '1-state/provider/counter_view_model.dart';
import '3-state/data/repository/mind_repository.dart';
import '3-state/service/local_db_servise.dart';
import '4-state-getx/ui/counter_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductsViewModel(),
    ),
    ChangeNotifierProvider(
        create: (context) => MindsViewModel(
              repository: MindRepository(db: LocalDatabase()),
            )),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokerPage(),
    );
  }
}
