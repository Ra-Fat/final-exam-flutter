import 'package:flutter/material.dart';
import '../theme.dart';
import '../../models/restaurant_command.dart';

Widget bottomshet(BuildContext context) {
  final TextEditingController commentController = TextEditingController();
  int selectedRating = 5;

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "How was your dinner?",
              style: TextStyle(fontSize: AppTexts.large),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: selectedRating,
              decoration: const InputDecoration(
                labelText: "Rating",
                border: OutlineInputBorder(),
              ),
              items: List.generate(5, (index) {
                final value = index + 1;
                return DropdownMenuItem(
                  value: value,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 8),
                      Text("$value Stars"),
                    ],
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedRating = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: "Any feedback",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (commentController.text.trim().isEmpty) {
                    return;
                  }
                  final newComment = RestaurantComment(
                    title: commentController.text.trim(),
                    rating: selectedRating,
                  );
                  Navigator.pop(context, newComment);
                },
                child: const Text("Comment"),
              ),
            ),
          ],
        ),
      );
    },
  );
}
