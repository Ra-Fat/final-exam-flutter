import 'package:flutter/material.dart';

import 'models/restaurant.dart';
import 'models/restaurant_command.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<RestaurantComment> comments = [
      RestaurantComment(
        title: "Testing", 
        rating: 2
      )
    ];
    
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Street 174, Phnom Penh',
        type: RestaurantType.khmer,
        comment: comments
      ),
      
      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Sisowath Quay, Phnom Penh',
        type: RestaurantType.french,
        comment: comments

      ),
      
      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.italian,
        comment: comments
      ),
      
      Restaurant(
        name: 'Final Tacos',
        address: 'Street Exam, Phnom Penh',
        type: RestaurantType.mexican,
        comment: comments
      ),
      Restaurant(
        name: 'No money no Rice',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.streetfood,
        comment: comments
      ),

       Restaurant(
        name: 'Ronano the Besto',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
        comment: comments
      ),
       
    ];
    return result;
  }
}
