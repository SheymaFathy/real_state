import 'package:bloc/bloc.dart';
import 'package:real_state/features/main_screen/pages/search/search_model.dart';
import 'package:real_state/features/main_screen/pages/search/search_repo.dart';
import 'package:real_state/features/main_screen/pages/search/search_set_model.dart' show SearchSetModel;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());
  final SearchRepository searchRepository;
  getData(SearchSetModel searchSetModel)async{
    emit(SearchLoading());
    try {
      final response=await searchRepository.getUnits(searchSetModel);
emit(SearchSuccess(response));
    } catch (e) {
     emit(SearchError("Error fetching data"));
    }
  }
}
