import 'package:flutter/material.dart';
import 'package:store/models/products_model.dart';
import 'package:store/products/bloc/product_bloc.dart';
import 'package:store/widgets/gridview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

 // late Future<List<ProductsModel>> productList;

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = ProductBloc();
    productBloc.add(ProductInitialFetchingEvents());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: SafeArea(
        child: BlocConsumer<ProductBloc, ProductState>(
          bloc: productBloc,
          listenWhen: (previous, current) => current is ProductActionState,
        buildWhen: (previous, current) => current is! ProductActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProductfetchingLoadingState():
                return const Center(child: CircularProgressIndicator());
              case ProductFetchingSuccessfulState:
            
            final successState = state as ProductFetchingSuccessfulState;
            // return WidgetgridView(SuccessState: SuccessState,);

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: successState.products.length,
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
                                    image: NetworkImage(successState
                                        .products[index].productImage),
                                    fit: BoxFit.cover)),
                          )),
                          Text(
                            successState.products[index].productTitle,
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
                  default :
          return const SizedBox();
            }

          },
        ),
       
      ),
    );
  }
}
