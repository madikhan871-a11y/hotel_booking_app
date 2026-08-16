import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class PriceSummary extends StatelessWidget {
  final double pricePerNight;
  final int nights;
  final double totalPrice;

  const PriceSummary({
    super.key,
    required this.pricePerNight,
    required this.nights,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _buildRow(
            'Room price',
            '\$${pricePerNight.toStringAsFixed(0)} × $nights',
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.border,
          ),
          const SizedBox(height: 10),
          _buildRow(
            'Total',
            '\$${totalPrice.toStringAsFixed(0)}',
            bold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
      String title,
      String value, {
        bool bold = false,
      }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: bold
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              fontWeight:
              bold ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: bold
                ? AppColors.primary
                : AppColors.textPrimary,
            fontWeight:
            bold ? FontWeight.w900 : FontWeight.w600,
            fontSize: bold ? 18 : 14,
          ),
        ),
      ],
    );
  }
}