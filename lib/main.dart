import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managments_app/2-state/ui/products_page.dart';
import 'package:state_managments_app/2-state/view_model/products_view_model.dart';
import 'package:state_managments_app/3-state/ui/all_minds_page.dart';
import 'package:state_managments_app/3-state/ui/write_to_db_page.dart';
import 'package:state_managments_app/3-state/view_model/minds_view_model.dart';
import 'package:state_managments_app/4-state/ui/counter_page.dart';

import '1-state/provider/counter_view_model.dart';
import '1-state/provider/provider_counter.dart';
import '3-state/data/repository/mind_repository.dart';
import '3-state/service/local_db_servise.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterViewModel(),),
        ChangeNotifierProvider(create: (context) => ProductsViewModel(),),
        ChangeNotifierProvider(create: (context) => MindsViewModel(repository: MindRepository(db: LocalDatabase()),)),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  CounterPage(),
    );
  }
}

