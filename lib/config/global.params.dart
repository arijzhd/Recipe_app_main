import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "plats",
      "icon": Icon(
        Icons.food_bank,
        color: Colors.blueAccent,
      ),
      "route": "/home"
    },
    {
      "title": "sweets",
      "icon": Icon(
        Icons.cake,
        color: Colors.blueAccent,
      ),
      "route": "/sweets" 
    },
    {
      "title": "diet",
      "icon": Icon(
        Icons.health_and_safety,
        color: Colors.blueAccent,
      ),
      "route": "/diet"
    },
    {
      "title": "favorite",
      "icon": Icon(
        Icons.favorite,
        color: Colors.blueAccent,
      ),
      "route": "/favorite"
    },
    {
      "title": "Déconnexion",
      "icon": Icon(
        Icons.logout,
        color: Colors.blueAccent,
      ),
      "route": "/authentification"
    },
  ];
}
