import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/home/data/repo/home_repo.dart'
    show HomeRepository;

import 'home_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final HomeRepository repository;

  UnitCubit(this.repository) : super(UnitInitial());
  Future<void> getUnits() async {
    emit(UnitLoading());
    try {
      final units = await repository.fetchUnits();
      emit(UnitLoaded(units));
    } catch (e) {
      emit(UnitError('فشل في تحميل الوحدات'));
    }
  }
}
