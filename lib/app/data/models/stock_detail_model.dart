class StockDetailModel {
  String? symbol;
  String? assetType;
  String? name;
  String? description;
  String? cik;
  String? exchange;
  String? currency;
  String? country;
  String? sector;
  String? industry;
  String? address;
  String? officialSite;
  String? fiscalYearEnd;
  String? latestQuarter;
  String? marketCapitalization;
  String? ebitda;
  String? peRatio;
  String? pegRatio;
  String? bookValue;
  String? dividendPerShare;
  String? dividendYield;
  String? eps;
  String? revenuePerShareTTM;
  String? profitMargin;
  String? operatingMarginTTM;
  String? returnOnAssetsTTM;
  String? returnOnEquityTTM;
  String? revenueTTM;
  String? grossProfitTTM;
  String? dilutedEPSTTM;
  String? quarterlyEarningsGrowthYOY;
  String? quarterlyRevenueGrowthYOY;
  String? analystTargetPrice;
  String? analystRatingStrongBuy;
  String? analystRatingBuy;
  String? analystRatingHold;
  String? analystRatingSell;
  String? analystRatingStrongSell;
  String? trailingPE;
  String? forwardPE;
  String? priceToSalesRatioTTM;
  String? priceToBookRatio;
  String? evToRevenue;
  String? evToEbitda;
  String? beta;
  String? s52WeekHigh;
  String? s52WeekLow;
  String? s50DayMovingAverage;
  String? s200DayMovingAverage;
  String? sharesOutstanding;
  String? dividendDate;
  String? exDividendDate;

  StockDetailModel({
    this.symbol,
    this.assetType,
    this.name,
    this.description,
    this.cik,
    this.exchange,
    this.currency,
    this.country,
    this.sector,
    this.industry,
    this.address,
    this.officialSite,
    this.fiscalYearEnd,
    this.latestQuarter,
    this.marketCapitalization,
    this.ebitda,
    this.peRatio,
    this.pegRatio,
    this.bookValue,
    this.dividendPerShare,
    this.dividendYield,
    this.eps,
    this.revenuePerShareTTM,
    this.profitMargin,
    this.operatingMarginTTM,
    this.returnOnAssetsTTM,
    this.returnOnEquityTTM,
    this.revenueTTM,
    this.grossProfitTTM,
    this.dilutedEPSTTM,
    this.quarterlyEarningsGrowthYOY,
    this.quarterlyRevenueGrowthYOY,
    this.analystTargetPrice,
    this.analystRatingStrongBuy,
    this.analystRatingBuy,
    this.analystRatingHold,
    this.analystRatingSell,
    this.analystRatingStrongSell,
    this.trailingPE,
    this.forwardPE,
    this.priceToSalesRatioTTM,
    this.priceToBookRatio,
    this.evToRevenue,
    this.evToEbitda,
    this.beta,
    this.s52WeekHigh,
    this.s52WeekLow,
    this.s50DayMovingAverage,
    this.s200DayMovingAverage,
    this.sharesOutstanding,
    this.dividendDate,
    this.exDividendDate,
  });

  /// Factory constructor to create object from JSON
  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    return StockDetailModel(
      symbol: json['Symbol'],
      assetType: json['AssetType'],
      name: json['Name'],
      description: json['Description'],
      cik: json['CIK'],
      exchange: json['Exchange'],
      currency: json['Currency'],
      country: json['Country'],
      sector: json['Sector'],
      industry: json['Industry'],
      address: json['Address'],
      officialSite: json['OfficialSite'],
      fiscalYearEnd: json['FiscalYearEnd'],
      latestQuarter: json['LatestQuarter'],
      marketCapitalization: json['MarketCapitalization'],
      ebitda: json['EBITDA'],
      peRatio: json['PERatio'],
      pegRatio: json['PEGRatio'],
      bookValue: json['BookValue'],
      dividendPerShare: json['DividendPerShare'],
      dividendYield: json['DividendYield'],
      eps: json['EPS'],
      revenuePerShareTTM: json['RevenuePerShareTTM'],
      profitMargin: json['ProfitMargin'],
      operatingMarginTTM: json['OperatingMarginTTM'],
      returnOnAssetsTTM: json['ReturnOnAssetsTTM'],
      returnOnEquityTTM: json['ReturnOnEquityTTM'],
      revenueTTM: json['RevenueTTM'],
      grossProfitTTM: json['GrossProfitTTM'],
      dilutedEPSTTM: json['DilutedEPSTTM'],
      quarterlyEarningsGrowthYOY: json['QuarterlyEarningsGrowthYOY'],
      quarterlyRevenueGrowthYOY: json['QuarterlyRevenueGrowthYOY'],
      analystTargetPrice: json['AnalystTargetPrice'],
      analystRatingStrongBuy: json['AnalystRatingStrongBuy'],
      analystRatingBuy: json['AnalystRatingBuy'],
      analystRatingHold: json['AnalystRatingHold'],
      analystRatingSell: json['AnalystRatingSell'],
      analystRatingStrongSell: json['AnalystRatingStrongSell'],
      trailingPE: json['TrailingPE'],
      forwardPE: json['ForwardPE'],
      priceToSalesRatioTTM: json['PriceToSalesRatioTTM'],
      priceToBookRatio: json['PriceToBookRatio'],
      evToRevenue: json['EVToRevenue'],
      evToEbitda: json['EVToEBITDA'],
      beta: json['Beta'],
      s52WeekHigh: json['52WeekHigh'],
      s52WeekLow: json['52WeekLow'],
      s50DayMovingAverage: json['50DayMovingAverage'],
      s200DayMovingAverage: json['200DayMovingAverage'],
      sharesOutstanding: json['SharesOutstanding'],
      dividendDate: json['DividendDate'],
      exDividendDate: json['ExDividendDate'],
    );
  }

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'Symbol': symbol,
      'AssetType': assetType,
      'Name': name,
      'Description': description,
      'CIK': cik,
      'Exchange': exchange,
      'Currency': currency,
      'Country': country,
      'Sector': sector,
      'Industry': industry,
      'Address': address,
      'OfficialSite': officialSite,
      'FiscalYearEnd': fiscalYearEnd,
      'LatestQuarter': latestQuarter,
      'MarketCapitalization': marketCapitalization,
      'EBITDA': ebitda,
      'PERatio': peRatio,
      'PEGRatio': pegRatio,
      'BookValue': bookValue,
      'DividendPerShare': dividendPerShare,
      'DividendYield': dividendYield,
      'EPS': eps,
      'RevenuePerShareTTM': revenuePerShareTTM,
      'ProfitMargin': profitMargin,
      'OperatingMarginTTM': operatingMarginTTM,
      'ReturnOnAssetsTTM': returnOnAssetsTTM,
      'ReturnOnEquityTTM': returnOnEquityTTM,
      'RevenueTTM': revenueTTM,
      'GrossProfitTTM': grossProfitTTM,
      'DilutedEPSTTM': dilutedEPSTTM,
      'QuarterlyEarningsGrowthYOY': quarterlyEarningsGrowthYOY,
      'QuarterlyRevenueGrowthYOY': quarterlyRevenueGrowthYOY,
      'AnalystTargetPrice': analystTargetPrice,
      'AnalystRatingStrongBuy': analystRatingStrongBuy,
      'AnalystRatingBuy': analystRatingBuy,
      'AnalystRatingHold': analystRatingHold,
      'AnalystRatingSell': analystRatingSell,
      'AnalystRatingStrongSell': analystRatingStrongSell,
      'TrailingPE': trailingPE,
      'ForwardPE': forwardPE,
      'PriceToSalesRatioTTM': priceToSalesRatioTTM,
      'PriceToBookRatio': priceToBookRatio,
      'EVToRevenue': evToRevenue,
      'EVToEBITDA': evToEbitda,
      'Beta': beta,
      '52WeekHigh': s52WeekHigh,
      '52WeekLow': s52WeekLow,
      '50DayMovingAverage': s50DayMovingAverage,
      '200DayMovingAverage': s200DayMovingAverage,
      'SharesOutstanding': sharesOutstanding,
      'DividendDate': dividendDate,
      'ExDividendDate': exDividendDate,
    };
  }
}
