import 'package:flutter/cupertino.dart';
import 'package:state_managments_app/2-state/data/product_model/product_model.dart';
import 'package:state_managments_app/2-state/servise/api_service.dart';

class ProductViewModel extends ChangeNotifier {
  ProductModel? products;
  bool isLoading = false;

  void getSingleProduct() async {
    changeLoadingState();
    products = await ApiService().getAllProducts();
    changeLoadingState();
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
