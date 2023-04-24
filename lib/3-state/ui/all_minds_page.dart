import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managments_app/3-state/ui/widget/mind_item.dart';
import 'package:state_managments_app/3-state/view_model/minds_view_model.dart';

class AllMindsPage extends StatelessWidget {
  const AllMindsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All minds Page"),
      ),
      body: Consumer<MindsViewModel>(
        builder: (context, value, child) {
          if (value.minds == null) {
            context.read<MindsViewModel>().readMinds();
          } else if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: value.minds!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var mind = value.minds![index];
                return MindItem(mind: mind);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
