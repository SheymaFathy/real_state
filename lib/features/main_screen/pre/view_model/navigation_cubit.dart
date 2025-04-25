import 'package:bloc/bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(1);
  void updateIndex(int index) => emit(index);
}
