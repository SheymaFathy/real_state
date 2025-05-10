import 'package:bloc/bloc.dart';
import '../../data/model/search_model.dart';
import '../../data/model/search_set_model.dart';
import '../../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());
  final SearchRepository searchRepository;

  SearchModel? searchModel;
  getData(SearchSetModel searchSetModel)async{
    emit(SearchLoading());
    try {
      final response= await searchRepository.getUnits(searchSetModel);
      searchModel = response;
      emit(SearchSuccess(response));
    } catch (e) {
      emit(SearchError("Error fetching data"));
    }
  }
}