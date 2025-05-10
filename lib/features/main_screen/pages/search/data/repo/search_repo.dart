// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:real_state/features/main_screen/pages/search/data/model/search_model.dart';
import '../model/search_set_model.dart';

class SearchRepository {
  final Dio _dio = Dio();

  Future<SearchModel> getUnits(SearchSetModel searchSetModel) async {
    try {
      final response = await _dio.get(
        'https://propertyapi.runasp.net/Units/Get-All-Units',
        queryParameters: searchSetModel.toJson(),
      );
      if (response.statusCode == 200) {
        SearchModel units = SearchModel.fromJson(response.data);
        print(response.data);
        return units;
      } else {
        throw Exception('Failed to load units');
      }
    } catch (e) {
      print("error in repo $e");
      throw Exception('Failed to load units');

    }
  }
}
