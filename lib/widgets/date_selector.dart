import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class DateSelector extends StatelessWidget {
  final DateTime checkIn;
  final DateTime checkOut;
  final VoidCallback onCheckInTap;
  final VoidCallback onCheckOutTap;

  const DateSelector({
    super.key,
    required this.checkIn,
    required this.checkOut,
    required this.onCheckInTap,
    required this.onCheckOutTap,
  });

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DateBox(
            label: 'Check-in',
            date: _formatDate(checkIn),
            icon: Icons.login_rounded,
            onTap: onCheckInTap,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _DateBox(
            label: 'Check-out',
            date: _formatDate(checkOut),
            icon: Icons.logout_rounded,
            onTap: onCheckOutTap,
          ),
        ),
      ],
    );
  }
}

class _DateBox extends StatelessWidget {
  final String label;
  final String date;
  final IconData icon;
  final VoidCallback onTap;

  const _DateBox({
    required this.label,
    required this.date,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 17,
                  color: AppColors.gold,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              date,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}