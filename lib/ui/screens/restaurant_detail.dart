import 'package:final_exam/ui/screens/restaurant_comments_form.dart';
import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../theme.dart';
import '../../models/restaurant_command.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import './restaurant_comments_view.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetail({super.key, required this.restaurant});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  late List<RestaurantComment> comments;

  @override
  void initState() {
    super.initState();
    comments = List.from(widget.restaurant.comment);
  }

  void _addComment(RestaurantComment comment) {
    setState(() {
      comments.add(comment);
    });
  }

  Future<void> _showAddCommentSheet() async {
    final newComment = await showModalBottomSheet<RestaurantComment>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => bottomshet(context),
    );

    if (newComment != null) {
      _addComment(newComment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.main,
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(fontSize: AppTexts.large),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: AppTexts.normal),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RestaurantTypeChip(type: widget.restaurant.type),
                      const SizedBox(width: 15),
                      StarsChip(
                        rating: comments.isNotEmpty ? comments.first.rating : 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            if (comments.isEmpty)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'No comments yet.',
                  style: TextStyle(
                    fontSize: AppTexts.normal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final c = comments[index];
                  return RestaurantCommentsView(
                    comment: c.title,
                    rating: c.rating,
                  );
                },
              ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _showAddCommentSheet,
      ),
    );
  }
}
