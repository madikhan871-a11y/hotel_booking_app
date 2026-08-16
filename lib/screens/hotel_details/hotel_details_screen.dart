import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/hotel.dart';
import '../../widgets/date_selector.dart';
import '../../widgets/guest_selector.dart';
import '../booking_confirmation/booking_confirmation_screen.dart';

class HotelDetailsScreen extends StatefulWidget {
  final Hotel hotel;

  const HotelDetailsScreen({
    super.key,
    required this.hotel,
  });

  @override
  State<HotelDetailsScreen> createState() =>
      _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  DateTime _checkIn =
  DateTime.now().add(const Duration(days: 1));

  DateTime _checkOut =
  DateTime.now().add(const Duration(days: 2));

  int _guests = 2;

  int get _nights =>
      _checkOut.difference(_checkIn).inDays;

  double get _totalPrice =>
      widget.hotel.pricePerNight * _nights;

  Future<void> _selectDate({
    required bool isCheckIn,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? _checkIn : _checkOut,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (picked == null) return;

    setState(() {
      if (isCheckIn) {
        _checkIn = picked;

        if (!_checkOut.isAfter(_checkIn)) {
          _checkOut = _checkIn.add(
            const Duration(days: 1),
          );
        }
      } else {
        if (picked.isAfter(_checkIn)) {
          _checkOut = picked;
        }
      }
    });
  }

  void _bookNow() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BookingConfirmationScreen(
            hotel: widget.hotel,
            checkIn: _checkIn,
            checkOut: _checkOut,
            guests: _guests,
            totalPrice: _totalPrice,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hotel = widget.hotel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hotel Details',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(26),
                ),
                child: Image.network(
                  hotel.imageUrl,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                  errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                      ) {
                    return Container(
                      height: 240,
                      color: AppColors.border,
                      child: const Center(
                        child: Icon(
                          Icons.hotel_rounded,
                          size: 65,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            hotel.name,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.gold,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          hotel.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.textSecondary,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          hotel.location,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'About this hotel',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      hotel.description,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Select your stay',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 14),

                    DateSelector(
                      checkIn: _checkIn,
                      checkOut: _checkOut,
                      onCheckInTap: () {
                        _selectDate(isCheckIn: true);
                      },
                      onCheckOutTap: () {
                        _selectDate(isCheckIn: false);
                      },
                    ),

                    const SizedBox(height: 14),

                    GuestSelector(
                      guests: _guests,
                      onChanged: (value) {
                        setState(() {
                          _guests = value;
                        });
                      },
                    ),

                    const SizedBox(height: 22),

                    _buildPriceSummary(),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _bookNow,
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                        ),
                        label: const Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceSummary() {
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
      child: Row(
        children: [
          const Icon(
            Icons.receipt_long_rounded,
            color: AppColors.gold,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${widget.hotel.pricePerNight.toStringAsFixed(0)} × $_nights nights',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total: \$${_totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}