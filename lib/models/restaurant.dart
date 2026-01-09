import 'restaurant_type.dart';
import './restaurant_command.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestaurantComment> comment;
 
  Restaurant({required this.name, required this.address, required this.type, required this.comment});
}
