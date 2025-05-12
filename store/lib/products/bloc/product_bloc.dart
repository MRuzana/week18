import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/models/products_model.dart';
import 'package:store/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
   

   on<ProductInitialFetchingEvents>(productInitialFetchingEvents);
  }

  FutureOr<void> productInitialFetchingEvents(ProductInitialFetchingEvents event, Emitter<ProductState> emit) async {
   
    emit(ProductfetchingLoadingState());

   List<ProductsModel> productlist = await ProductRepo().fetchProduct();
   emit(ProductFetchingSuccessfulState(products: productlist));
  }
}
