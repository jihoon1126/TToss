import 'package:flutter/material.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;

  const StockDetailScreen({super.key, required this.stockName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('주식 상세'),
          ],
        ),
      ),
    );
  }
}
