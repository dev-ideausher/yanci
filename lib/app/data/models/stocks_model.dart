import 'dart:math';

class StockModel {
  final String stockName;
  final String fullName;
  final double price;
  bool isProfit;
  double percentage;
  final String imageUrl;
  final List<Point> points;
  final StockFundamentals stockFundamentals;
  final CompanyFundamentals companyFundamentals;

  StockModel({
    required this.stockName,
    required this.fullName,
    required this.price,
    required this.isProfit,
    required this.percentage,
    required this.imageUrl,
    required this.points,
    required this.stockFundamentals,
    required this.companyFundamentals,
  });
}

class Point {
  final double x;
  final double y;

  Point({required this.x, required this.y});
}

class StockFundamentals {
  final double dayHigh;
  final double shareOut;
  final double openPrice;
  final double week52High;
  final double dayLow;
  final double volume;
  final double week52Low;

  StockFundamentals({
    required this.dayHigh,
    required this.shareOut,
    required this.openPrice,
    required this.week52High,
    required this.dayLow,
    required this.volume,
    required this.week52Low,
  });
}

class CompanyFundamentals {
  final double roe;
  final double marketCap;
  final double shareOut;
  final double dividendPerShare;
  final double peRatio;
  final double pbRatio;
  final double dividendYield;
  final double debtToEquity;

  CompanyFundamentals({
    required this.roe,
    required this.marketCap,
    required this.shareOut,
    required this.dividendPerShare,
    required this.peRatio,
    required this.pbRatio,
    required this.dividendYield,
    required this.debtToEquity,
  });
}

// some random stocks
List<StockModel> randomStockData = [];

void generateRandomStockData() {
  randomStockData = List.generate(
    10,
    (index) => StockModel(
      stockName: 'Stock $index',
      fullName: 'Company Name $index',
      price: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
      isProfit: Random().nextBool(),
      percentage: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
      imageUrl: 'https://via.placeholder.com/150',
      points: List.generate(
        10,
        (index) => Point(
          x: index.toDouble(),
          y: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
        ),
      ),
      stockFundamentals: StockFundamentals(
        dayHigh: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
        shareOut: double.parse((Random().nextDouble() * 1000).toStringAsFixed(2)),
        openPrice: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
        week52High: double.parse((Random().nextDouble() * 200).toStringAsFixed(2)),
        dayLow: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
        volume: double.parse((Random().nextDouble() * 1000000).toStringAsFixed(2)),
        week52Low: double.parse((Random().nextDouble() * 200).toStringAsFixed(2)),
      ),
      companyFundamentals: CompanyFundamentals(
        roe: double.parse((Random().nextDouble() * 30).toStringAsFixed(2)),
        marketCap: double.parse((Random().nextDouble() * 1000000).toStringAsFixed(2)),
        shareOut: double.parse((Random().nextDouble() * 1000).toStringAsFixed(2)),
        dividendPerShare: double.parse((Random().nextDouble() * 10).toStringAsFixed(2)),
        peRatio: double.parse((Random().nextDouble() * 30).toStringAsFixed(2)),
        pbRatio: double.parse((Random().nextDouble() * 5).toStringAsFixed(2)),
        dividendYield: double.parse((Random().nextDouble() * 5).toStringAsFixed(2)),
        debtToEquity: double.parse((Random().nextDouble() * 2).toStringAsFixed(2)),
      ),
    ),
  );
  for (var stock in randomStockData) {
    if (stock.points.isNotEmpty) {
      double firstY = stock.points.first.y;
      double lastY = stock.points.last.y;
      if (firstY > lastY) {
        stock.isProfit = false;
      } else {
        stock.isProfit = true;
      }
      double difference = (lastY - firstY).abs();

      double percentageChange = (difference / firstY) * 100;
      if (percentageChange >= 100) {
        percentageChange = (percentageChange.roundToDouble());
      } else {
        percentageChange = double.parse(percentageChange.toStringAsFixed(2));
      }
      stock.percentage = percentageChange;
    }
  }
}
