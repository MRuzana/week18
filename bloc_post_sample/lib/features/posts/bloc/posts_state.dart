part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

abstract class PostActionState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataModel> posts;

  PostFetchingSuccessfulState({required this.posts});
}

class PostfetchingLoadingState extends PostsState {}

class PostfetchingErrorState extends PostsState {
  final String errorMessage;

  PostfetchingErrorState({required this.errorMessage});
}


class PostAdditionSuccessState extends PostActionState{

}

class PostAdditionErrorState extends PostActionState{

}