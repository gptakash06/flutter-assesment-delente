import 'dart:convert';

import '../../utils/helpers/api_helper.dart';
import '../models/stock_detail_model.dart';

class StockRepository {
  final ApiHelper _apiHelper = ApiHelper();

  Future<StockDetailModel?> fetchStockDetails(String symbol) async {
    try {
      final response = await _apiHelper.get("OVERVIEW", symbol: symbol);

      if (response == null) {
        print("Error: API returned null response.");
        return null;
      }

      if (response is Map<String, dynamic>) {
        print("API Response: $response");
        return StockDetailModel.fromJson(response);
      } else if (response is String) {
        print("Raw String Response: $response");
        final Map<String, dynamic> decodedResponse = jsonDecode(response);
        return StockDetailModel.fromJson(decodedResponse);
      } else {
        print("Unexpected response format: $response");
        return null;
      }
    } catch (e) {
      print("Error fetching stock details: $e");
      return null;
    }
  }
}