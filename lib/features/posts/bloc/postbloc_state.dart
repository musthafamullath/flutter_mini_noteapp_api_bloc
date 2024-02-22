part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocState {}

final class PostblocInitial extends PostblocState {}

abstract class PostsActionState extends PostblocState{}

class PostsFetchingLoadingState extends PostblocState{}
class PostsFetchingErrorState extends PostblocState{}



class PostFetchingSuccessfullState extends PostblocState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfullState({required this.posts});
}
class PostAdditionSeccessState extends PostsActionState{}
class PostAdditionErrorState extends PostsActionState{}
