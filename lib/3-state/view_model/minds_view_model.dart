import 'package:flutter/cupertino.dart';
import 'package:state_managments_app/3-state/data/repository/mind_repository.dart';

import '../data/model/mind_model.dart';

class MindsViewModel extends ChangeNotifier {
  MindRepository? repository;

  MindsViewModel({this.repository});

  List<MindModel>? minds;
  bool isLoading = false;

  void addMind(MindModel mind) async {
    repository!.addMain(mind);
  }

  void readMinds() async {
    loadingChanger();
    minds = await repository!.readMind();
    loadingChanger();
  }

  void updateMind(MindModel mindModel, String mind) async {
    repository!.updateMind(mindModel, mind);
    readMinds();
  }

  void deleteMind(String mind) async {
    repository!.deleteMind(mind);
    readMinds();
  }

  void loadingChanger() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
