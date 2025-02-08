import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../data/models/local_stock_model.dart';
import '../data/models/stock_detail_model.dart';
import '../data/models/stocks_model.dart';
import '../data/repositories/stock_repository.dart';

class StockController extends GetxController {
  final StockRepository _repository = StockRepository();
  var stocks = <StockModel>[].obs;
  var stockDetail = Rxn<StockDetailModel>();
  var isLoading = false.obs;
  var stockList = <Stock>[].obs;

  @override
  void onInit() {
    loadStocks(); // Load local stocks on initialization
    super.onInit();
  }

  void fetchStockDetails(String symbol) async {
    isLoading.value = true;
    try {
      var details = await _repository.fetchStockDetails(symbol);
      if (details != null) {
        stockDetail.value = details;
      } else {
        print("Error: Stock details returned null for symbol: $symbol");
      }
    } catch (e) {
      print("Exception while fetching stock details: $e");
    } finally {
      isLoading.value = false; // Ensure loading state is always reset
    }
  }

  Future<void> loadStocks() async {
    try {
      final String response = await rootBundle.loadString('assets/stocks.json');
      final data = json.decode(response);
      stockList.value = (data['stocks'] as List).map((e) => Stock.fromJson(e)).toList();
    } catch (e) {
      print("Error loading stock list: $e");
    }
  }
}
