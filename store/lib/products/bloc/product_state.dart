part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

abstract class ProductActionState extends ProductState{}

class ProductFetchingSuccessfulState extends ProductState{

  final List<ProductsModel> products;

  ProductFetchingSuccessfulState({required this.products}); 
}

  class ProductfetchingLoadingState extends ProductState{}

class ProductfetchingErrorState extends ProductState{}



