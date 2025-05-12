part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductInitialFetchingEvents extends ProductEvent{}