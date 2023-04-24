import 'package:flutter/material.dart';
import 'package:state_managments_app/2-state/ui/description_page.dart';

import '../data/product_model/product_model.dart';

class ProductItem extends StatelessWidget {
  ProductModel product;
   ProductItem({required this.product,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionPage(),));
      },
      child: Container(
        margin: const EdgeInsets.all(12),

        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: ListTile(
          title: Text(product.title!),

          subtitle: Image.network(product.image!,height: 60,),
        ),
      ),
    );
  }
}
