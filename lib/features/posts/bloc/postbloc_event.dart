part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocEvent {}
class PostInitialFetchEvent extends PostblocEvent{}
class PostAddEvent extends PostblocEvent{}