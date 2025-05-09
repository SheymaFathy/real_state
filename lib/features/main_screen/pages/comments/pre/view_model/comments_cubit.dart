import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/comments_model.dart';
import '../../data/repo/comments_repo.dart';
part 'comments_state.dart';

class CommentCubit extends Cubit<CommentsState> {
  final CommentRepository commentRepository;

  CommentCubit({required this.commentRepository}) : super(CommentInitial());

  Future<void> postComment(int unitId, String content) async {
    try {
      emit(CommentLoading());

      final commentModel = CommentModel(unitId: unitId, content: content);

      await commentRepository.postComment(commentModel);

      emit(CommentSuccess());
    } catch (error) {
      print("Error posting comment: ${error.toString()}");
      emit(CommentError(message: error.toString()));
    }
  }
}
