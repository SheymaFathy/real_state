import 'package:dio/dio.dart';
import 'package:real_state/features/main_screen/pages/search/search_model.dart';
import 'package:real_state/features/main_screen/pages/search/search_set_model.dart';
import '../home/data/model/unit_model.dart';

class SearchRepository {
  final Dio _dio = Dio();

  Future<SearchModel> getUnits(SearchSetModel searchSetModel) async {
    print(searchSetModel.toJson());
    final response = await _dio.get(
      'https://propertyapi.runasp.net/Units/Get-All-Units',
      queryParameters:searchSetModel.toJson()
       //,queryParameters: searchSetModel.toJson(),
    );
print(response.statusCode);
    if (response.statusCode == 200) {
      SearchModel units = SearchModel.fromJson(response.data);
      print(response.data);
      return units;
    } else {

      throw Exception('Failed to load units');
    }
  }
}
