import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:note_app_api_bloc/features/posts/models/post_data_ui_model.dart';
import 'package:note_app_api_bloc/features/posts/repos/posts_repo.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  PostblocBloc() : super(PostblocInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostblocState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostRepo.fetchPosts();
    emit(PostFetchingSuccessfullState(posts: posts));
  }

  FutureOr<void> postAddEvent(
    PostAddEvent event,
    Emitter<PostblocState> emit,
  ) async{
    bool success = await PostRepo.addPosts();
    print(success);
    if(success){
      emit(PostAdditionSeccessState());
    }else{
      emit(PostAdditionErrorState());
    }
  }
}
