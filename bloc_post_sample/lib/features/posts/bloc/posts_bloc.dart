import 'dart:async';
import 'package:bloc_post_sample/features/posts/models/post_data_model.dart';
import 'package:bloc_post_sample/features/posts/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvents>(postsInitialFetchEvents);

    on<PostAddEvents>(postAddEvents);
  }

  FutureOr<void> postsInitialFetchEvents(
      PostsInitialFetchEvents event, Emitter<PostsState> emit) async {
    emit(PostfetchingLoadingState());

    try {
      List<PostDataModel> posts = await PostRepo.fetchpost();

      emit(PostFetchingSuccessfulState(posts: posts));
    } catch (e) {
      emit(PostfetchingErrorState(errorMessage: e.toString()));
    }
  }


  

  FutureOr<void> postAddEvents(PostAddEvents event, Emitter<PostsState> emit) async{
      bool success = await PostRepo.addPost();
      print(success);
      if(success){
        emit(PostAdditionSuccessState());
      }
      else{
        emit(PostAdditionErrorState());
      }

  }
}
