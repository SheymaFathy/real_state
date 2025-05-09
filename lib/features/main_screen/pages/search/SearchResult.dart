import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/search/search_cubit.dart';
import 'package:real_state/features/main_screen/pages/search/search_repo.dart';
import 'package:real_state/features/main_screen/pages/search/search_set_model.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key,required this.searchSetModel});
final SearchSetModel searchSetModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: BlocProvider(create: (context){
      return SearchCubit(SearchRepository())..getData(searchSetModel);
    },child: BlocBuilder<SearchCubit,SearchState>(builder: (context,state){
      if(state is SearchLoading){
        return const Center(child: CircularProgressIndicator());
      }else if(state is SearchSuccess){
        return ListView.builder(itemCount: state.searchModel.data!.length,itemBuilder: (context,index){
          return Card(child: Text(state.searchModel.data![index].address!));
        });
      }else if(state is SearchError){
        return Center(child: Text(state.message));
      }else{
        return const SizedBox();
      }
    },),),);

  }
}
