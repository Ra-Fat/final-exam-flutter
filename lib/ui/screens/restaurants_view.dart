import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../widgets/chip/stars_chip.dart';
import '../theme.dart';
import '../../models/restaurant_type.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../screens/restaurant_detail.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool khmerRes = false;

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = khmerRes
        ? widget.restaurants.where((r) => r.type == RestaurantType.khmer).toList()
        : widget.restaurants;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: khmerRes,
                  onChanged: (bool? value) {
                    setState(() {
                      khmerRes = value ?? false;
                    });
                  },
                ),
                const Text("Show only Khmer restaurants"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = filteredRestaurants[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetail(restaurant: restaurant),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColors,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(
                              fontSize: AppTexts.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              StarsChip(rating: restaurant.comment.isNotEmpty ? restaurant.comment.first.rating : 0),
                              const SizedBox(width: 15),
                              RestaurantTypeChip(type: restaurant.type)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
