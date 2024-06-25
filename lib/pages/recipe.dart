import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecipePage extends StatefulWidget {
  final String title;
  final String image; // This should be a URL to the image
  final List<String> ingredients;
  final String recipe;

  RecipePage({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.recipe,
  });

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    var result = await FirebaseFirestore.instance
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .where('title', isEqualTo: widget.title)
        .get();

    if (result.docs.isNotEmpty) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  void toggleFavorite() {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (isFavorite) {
      FirebaseFirestore.instance
          .collection('favorites')
          .where('userId', isEqualTo: userId)
          .where('title', isEqualTo: widget.title)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('favorites')
              .doc(element.id)
              .delete();
        });
      });
    } else {
      FirebaseFirestore.instance.collection('favorites').add({
        'title': widget.title,
        'ingredients': widget.ingredients,
        'recipe': widget.recipe,
        'userId': userId,
      });
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(252, 68, 193, 206),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,
                color: isFavorite ? Colors.red : Colors.black),
            onPressed: toggleFavorite,
            tooltip: 'Toggle Favorite',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.image,
              width: double.infinity, // Takes full width of the screen
              height: 200, // Fixed height for the image
              fit: BoxFit
                  .cover, // Covers the width while maintaining aspect ratio
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image, // Shows an icon if the image fails to load
                size: 200,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.list, color:  Color.fromARGB(252, 68, 193, 206)
                  ),
                  title: Text('Ingredients:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.ingredients.map((ingredient) {
                      return Text(ingredient);
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.book, color: Color.fromARGB(252, 68, 193, 206)
                  ),
                  title: Text('Recipe:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.recipe),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
