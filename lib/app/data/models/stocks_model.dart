class StockModel {
  final GlobalQuote globalQuote;

  StockModel({required this.globalQuote});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      globalQuote: GlobalQuote.fromJson(json['Global Quote'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Global Quote': globalQuote.toJson(),
    };
  }
}

class GlobalQuote {
  final String symbol;
  final String open;
  final String high;
  final String low;
  final String price;
  final String volume;
  final String latestTradingDay;
  final String previousClose;
  final String change;
  final String changePercent;

  GlobalQuote({
    required this.symbol,
    required this.open,
    required this.high,
    required this.low,
    required this.price,
    required this.volume,
    required this.latestTradingDay,
    required this.previousClose,
    required this.change,
    required this.changePercent,
  });

  factory GlobalQuote.fromJson(Map<String, dynamic> json) {
    return GlobalQuote(
      symbol: json['01. symbol'] ?? '',
      open: json['02. open'] ?? '',
      high: json['03. high'] ?? '',
      low: json['04. low'] ?? '',
      price: json['05. price'] ?? '',
      volume: json['06. volume'] ?? '',
      latestTradingDay: json['07. latest trading day'] ?? '',
      previousClose: json['08. previous close'] ?? '',
      change: json['09. change'] ?? '',
      changePercent: json['10. change percent'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01. symbol': symbol,
      '02. open': open,
      '03. high': high,
      '04. low': low,
      '05. price': price,
      '06. volume': volume,
      '07. latest trading day': latestTradingDay,
      '08. previous close': previousClose,
      '09. change': change,
      '10. change percent': changePercent,
    };
  }
}
