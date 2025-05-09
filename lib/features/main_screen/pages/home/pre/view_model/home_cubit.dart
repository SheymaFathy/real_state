import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final UnitRepository unitRepository;

  UnitCubit(this.unitRepository) : super(UnitInitial());

  // get all units
  Future<void> fetchUnits() async {
    emit(UnitLoading());
    try {
      final units = await unitRepository.getAllUnits();
      emit(UnitLoaded(units));
    } catch (e) {
      emit(UnitError(e.toString()));
    }
  }

  // get hot deals
  Future<void> fetchHotDeals() async {
    emit(UnitLoading());
    try {
      final hotDeals = await unitRepository.getHotDeals();
      emit(UnitLoaded(hotDeals));
    } catch (e) {
      emit(UnitError(e.toString()));
    }
  }

  // get unit details
  Future<void> fetchUnitDetails(int id) async {
    emit(UnitLoading());
    try {
      final unitDetails = await unitRepository.getUnitDetails(id);
      emit(UnitLoaded([unitDetails.first]));
    } catch (e) {
      emit(UnitError("حدث خطأ: $e"));
    }
  }

}
