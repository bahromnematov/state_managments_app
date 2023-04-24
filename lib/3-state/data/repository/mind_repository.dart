import 'package:state_managments_app/3-state/service/local_db_servise.dart';

import '../model/mind_model.dart';

class MindRepository {
  LocalDatabase? db;

  MindRepository({required this.db});

  void addMain(MindModel mind) async => await db!.addMind(mind);

  Future<List<MindModel>> readMind() async {
    var result = await db!.getMinds();
    return result.map((e) => MindModel.fromJson(e)).toList();
  }


void updateMind(MindModel mindModel,String mind)async=>await db!.updateMind(mindModel, mind);
void deleteMind(String mind)async=>await db!.deleteMind(mind);
}
