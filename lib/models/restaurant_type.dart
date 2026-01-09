import 'package:flutter/material.dart';

enum RestaurantType {
  streetfood(color: Color.fromARGB(255, 243, 212, 33) , name: 'streetfood'),
  french(color: Colors.blue,name: 'frenh'),
  italian(color: Color.fromARGB(255, 50, 190, 22), name: 'italian'),
  mexican(color: Color.fromARGB(171, 187, 59, 27), name: 'mexican'),
  khmer(color: Color.fromARGB(255, 58, 206, 193), name: 'khmer');

  final Color color;
  final String name;

  const RestaurantType({required this.color , required this.name});
}
