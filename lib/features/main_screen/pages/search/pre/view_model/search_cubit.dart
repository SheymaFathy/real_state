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
  void sortData(bool isBig) {
    if (searchModel != null) {
      searchModel!.data!.sort((a, b) {
        if (isBig == false) {
          return b.price!.compareTo(a.price!);
        } else {
          return a.price!.compareTo(b.price!);
        }
      });
      emit(SearchSuccess(searchModel!));
    }
  }
}