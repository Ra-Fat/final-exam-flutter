import 'package:flutter/material.dart';
import '../theme.dart';

class RestaurantCommentsView extends StatelessWidget {
  final String comment;
  final int rating;

  const RestaurantCommentsView({
    super.key,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12), 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), 
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( 
              child: Text(
                comment,
                style: TextStyle(fontSize: AppTexts.small, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              rating.toString(),
              style: TextStyle(fontSize: AppTexts.small, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
