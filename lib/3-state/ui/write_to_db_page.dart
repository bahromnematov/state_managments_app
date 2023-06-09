import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/mind_model.dart';
import '../view_model/minds_view_model.dart';
import 'all_minds_page.dart';

class WriteToDbPage extends StatelessWidget {
   WriteToDbPage({Key? key}) : super(key: key);
  TextEditingController mind= TextEditingController();
  TextEditingController author= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write to Db"),
        actions: [
          IconButton(onPressed: () {
            context.read<MindsViewModel>().readMinds();
            Navigator.push(context, MaterialPageRoute(builder: (context) => AllMindsPage(),));

          }, icon: const Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: mind,
              decoration: InputDecoration(
                label: Text("Quote"),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: author,
              decoration: InputDecoration(
                label: Text("Author"),
                border: OutlineInputBorder()
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          context.read<MindsViewModel>().addMind(MindModel(author: author.text, mind: mind.text));
        },
      ),
    );
  }
}
