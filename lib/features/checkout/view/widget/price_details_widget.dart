import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;
  final int itemsCount;

  const PriceDetails({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.lightCardColor,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPriceDetailItem(
              'Subtotal ($itemsCount items)',
              '\$${subtotal.toStringAsFixed(2)}',
            ),
            _buildPriceDetailItem(
                'Shipping', '\$${shipping.toStringAsFixed(2)}'),
            _buildPriceDetailItem('Tax', '\$${tax.toStringAsFixed(2)}'),
            const Divider(color: Colors.grey),
            _buildPriceDetailItem(
                'Total Amount', '\$${total.toStringAsFixed(2)}',
                isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetailItem(String label, String amount,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
