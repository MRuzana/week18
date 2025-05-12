import 'package:flutter/material.dart';
import 'package:store/models/products_model.dart';
import 'package:store/products/bloc/product_bloc.dart';

class WidgetgridView extends StatelessWidget {
 // final AsyncSnapshot<List<ProductsModel>> snapshot;

 final SuccessState ;
  WidgetgridView({super.key,required this.SuccessState});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: SuccessState.products.length,
        itemBuilder: (context, index) {
        
          return Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(SuccessState.products[index].productImage),
                            fit: BoxFit.cover)),
                  )),
                  Text(
                    SuccessState.products[index].productTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  )
                ],
              ),
            ),
          );
        });
  }
}
