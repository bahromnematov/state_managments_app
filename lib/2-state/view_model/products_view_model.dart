import 'package:flutter/cupertino.dart';
import 'package:state_managments_app/2-state/data/product_model/product_model.dart';
import 'package:state_managments_app/2-state/servise/api_service.dart';

class ProductsViewModel extends ChangeNotifier {
  List products = [];
  bool isLoading = false;

  void getAllProducts() async {
    changeLoadingState();
    products = await ApiService().getAllProducts();
    changeLoadingState();
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
