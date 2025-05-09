// comments_state.dart
part of 'comments_cubit.dart';

abstract class CommentsState {}

class CommentInitial extends CommentsState {}

class CommentLoading extends CommentsState {}

class CommentSuccess extends CommentsState {}

class CommentError extends CommentsState {
  final String message;
  CommentError({required this.message});
}
