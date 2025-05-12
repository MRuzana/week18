part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostsInitialFetchEvents extends PostsEvent{

}

class PostAddEvents extends PostsEvent{}