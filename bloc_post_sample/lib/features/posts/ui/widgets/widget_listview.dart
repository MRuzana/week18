import 'package:bloc_post_sample/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';

class widgetListVIew extends StatelessWidget {
  const widgetListVIew({
    super.key,
    required this.successState,
  });

  final PostFetchingSuccessfulState successState;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: successState.posts.length,
      itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.all(10),
          color: Colors.grey.shade200,
          child: Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(successState.posts[index].title,style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text(successState.posts[index].body)
              
              ],
            ),
          ),
        );
      }
    );
  }
}