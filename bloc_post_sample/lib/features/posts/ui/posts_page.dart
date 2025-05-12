import 'package:bloc_post_sample/features/posts/bloc/posts_bloc.dart';
import 'package:bloc_post_sample/features/posts/ui/widgets/widget_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  final PostsBloc postsBloc = PostsBloc();

  @override
  Widget build(BuildContext context) {

    final PostsBloc postsBloc = PostsBloc();
    postsBloc.add(PostsInitialFetchEvents());



    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Posts page')),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {},
        builder: (context, state) {

          switch(state.runtimeType){

            case PostfetchingLoadingState():
            return const Center(child: CircularProgressIndicator());

            case PostFetchingSuccessfulState:
            final successState = state as PostFetchingSuccessfulState;
            return widgetListVIew(successState: successState);

            case PostfetchingErrorState:
            final errorState = state as PostfetchingErrorState;
            return Center(child: Text('Failed to load products: ${errorState.errorMessage}'));

          default :
          return const SizedBox();

          }
          
        },
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){

        postsBloc.add(PostAddEvents());
      },child: const Icon(Icons.add),),
    );
  }
}


