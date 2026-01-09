// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';
import '../../theme.dart';

class StarsChip extends StatelessWidget {
  final int rating;
  const StarsChip({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
        child: Row(
          children: [
            Icon(Icons.star_rate, size: 15, color: AppColors.main),
            SizedBox(width: 5),
            Text(rating.toString()),
          ],
        ),
      ),
    );
  }
}
