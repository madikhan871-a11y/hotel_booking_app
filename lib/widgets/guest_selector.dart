import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class GuestSelector extends StatelessWidget {
  final int guests;
  final ValueChanged<int> onChanged;

  const GuestSelector({
    super.key,
    required this.guests,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.people_outline_rounded,
            color: AppColors.gold,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guests',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Number of guests',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: guests > 1
                ? () => onChanged(guests - 1)
                : null,
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
            ),
          ),
          Text(
            '$guests',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          IconButton(
            onPressed: () => onChanged(guests + 1),
            icon: const Icon(
              Icons.add_circle_outline_rounded,
            ),
          ),
        ],
      ),
    );
  }
}