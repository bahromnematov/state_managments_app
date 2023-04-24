import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managments_app/2-state/ui/product_item.dart';
import 'package:state_managments_app/2-state/view_model/products_view_model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Page"),
      ),
      body: Consumer<ProductsViewModel>(
        builder: (context, myProvider, child) {
          if(myProvider.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(myProvider.products.isNotEmpty){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: myProvider.products.length,
              itemBuilder: (context, index) => ProductItem(product: myProvider.products[index]),
            );
          }
          else{
            return const Text("Data yo'q");
          }

        },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductsViewModel>().getAllProducts();
        },
      ),
    );
  }
}
