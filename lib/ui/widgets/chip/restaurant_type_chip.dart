import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  final RestaurantType type; 

  const RestaurantTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        type.name,
        style: TextStyle(color: AppColors.whiteColors),
      ),
    );
  }
}
