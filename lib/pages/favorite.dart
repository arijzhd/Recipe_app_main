import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites"),
        backgroundColor: Color.fromARGB(252, 68, 193, 206),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('favorites')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text('Something went wrong: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                var document = snapshot.data!.docs[index];
                var data = document.data() as Map<String, dynamic>;
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text(
                      data['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients: ${data['ingredients'].join(', ')}',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Recipe: ${data['recipe']}',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () {
                      // Optionally implement onTap to do something when a user taps a recipe
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.grey),
                      onPressed: () => deleteFavorite(document.id),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No favorites added yet.'));
          }
        },
      ),
    );
  }

  void deleteFavorite(String docId) {
    FirebaseFirestore.instance
        .collection('favorites')
        .doc(docId)
        .delete()
        .then((_) => print('Favorite deleted'))
        .catchError((error) => print('Error deleting favorite: $error'));
  }
}
