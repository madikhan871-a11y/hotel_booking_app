import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/hotel.dart';
import '../../widgets/hotel_card.dart';
import '../hotel_details/hotel_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Hotel> hotels = [
    Hotel(
      name: 'Serene Grand Hotel',
      location: 'Islamabad, Pakistan',
      imageUrl:
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=900',
      rating: 4.8,
      pricePerNight: 120,
      description:
      'A comfortable luxury hotel with beautiful rooms and premium facilities.',
    ),
    Hotel(
      name: 'Royal Palm Resort',
      location: 'Lahore, Pakistan',
      imageUrl:
      'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=900',
      rating: 4.6,
      pricePerNight: 95,
      description:
      'A relaxing resort offering elegant rooms and excellent hospitality.',
    ),
    Hotel(
      name: 'Pearl View Hotel',
      location: 'Karachi, Pakistan',
      imageUrl:
      'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=900',
      rating: 4.7,
      pricePerNight: 85,
      description:
      'A modern hotel with comfortable accommodation and city views.',
    ),
  ];

  void _openHotelDetails(
      BuildContext context,
      Hotel hotel,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HotelDetailsScreen(
          hotel: hotel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'StayFinder',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Find your perfect stay',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            30,
          ),
          children: [
            _buildWelcome(),

            const SizedBox(height: 22),

            _buildSearchBox(),

            const SizedBox(height: 25),

            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Popular Hotels',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),

            const SizedBox(height: 8),

            ...hotels.map(
                  (hotel) => HotelCard(
                hotel: hotel,
                onTap: () => _openHotelDetails(
                  context,
                  hotel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where do you want to stay?',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 27,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Discover comfortable stays for your next trip.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search_rounded,
            color: AppColors.gold,
          ),
          hintText: 'Search hotels or locations',
          border: InputBorder.none,
        ),
      ),
    );
  }
}