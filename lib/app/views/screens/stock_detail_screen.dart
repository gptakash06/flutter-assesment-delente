import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart'; // For animations
import '../../../generated/lib/generated/locale_keys.g.dart';
import '../../controllers/stock_controller.dart';
import '../../utils/helpers/navigation_helper.dart';
import '../widgets/common_appBar_widget.dart';
import '../widgets/common_text_widget.dart';

class StockDetailScreen extends StatefulWidget {
  final String symbol;
  const StockDetailScreen(this.symbol, {super.key});

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  final StockController controller = Get.find<StockController>();

  @override
  void initState() {
    super.initState();
    controller.fetchStockDetails(widget.symbol);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CommonAppBarWidget(
        title: LocaleKeys.stock_details,
        leading:
        IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            NavigationHelper.goBack();
          },
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final stock = controller.stockDetail.value;
        if (stock == null) {
          return const Center(
            child: Text(
              "No Data Available",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Stock Symbol
                    Column(
                      children: [
                        Center(
                          child: CommonTextWidget(
                            text: stock.symbol ?? "N/A",
                            style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5),

                        Center(
                          child: CommonTextWidget(
                            text: stock.description ?? "N/A",
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Stock Details (Scrollable)
                    Expanded(
                      child: ListView(
                        children: [
                          _buildAnimatedRow(LocaleKeys.company, stock.name),
                          _buildAnimatedRow(LocaleKeys.market_cap, stock.marketCapitalization),
                          _buildAnimatedRow(LocaleKeys.pe_ratio, stock.peRatio),
                          _buildAnimatedRow(LocaleKeys.peg_ratio, stock.pegRatio),
                          _buildAnimatedRow(LocaleKeys.eps, stock.eps),
                          _buildAnimatedRow(LocaleKeys.dividend_yield, stock.dividendYield),
                          _buildAnimatedRow(LocaleKeys.book_value, stock.bookValue),
                          _buildAnimatedRow(LocaleKeys.profit_margin, "${stock.profitMargin}%"),
                          _buildAnimatedRow(LocaleKeys.revenue, stock.revenueTTM),
                          _buildAnimatedRow(LocaleKeys.operating_margin, "${stock.operatingMarginTTM}%"),
                          _buildAnimatedRow(LocaleKeys.roe, "${stock.returnOnEquityTTM}%"),
                          _buildAnimatedRow(LocaleKeys.high_52_week, stock.s52WeekHigh),
                          _buildAnimatedRow(LocaleKeys.low_52_week, stock.s52WeekLow),
                          _buildAnimatedRow(LocaleKeys.target_price, stock.analystTargetPrice),
                          // _buildAnimatedRow("Analyst Ratings", _formatRatings(stock)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Widget for Stock Data Rows with animation
  Widget _buildAnimatedRow(String label, dynamic value) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, opacity, child) {
        return AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget(
                  text: label,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                CommonTextWidget(
                  text: value != null ? value.toString() : "N/A",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}
