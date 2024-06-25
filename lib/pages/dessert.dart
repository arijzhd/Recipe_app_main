import 'package:cafe_restaut/pages/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class Dessert extends StatelessWidget {
  final List<MenuOption> menuOptions = [
    MenuOption(
      title: 'tarte au citron',
      image: 'images/tartes.jpeg',
      routeName:
          '/tarte_au_citron', // Add the route name for the CoffeeScreen page
      ingredients: ['sucre', 'citron', 'œufs', 'pâte brisée'],
      recipe:
          'Préchauffez le four à 180°C. Mélangez le sucre, le jus et le zeste de citron, les œufs battus, et versez cette préparation sur la pâte. Faites cuire pendant 25 à 30 minutes.',
    ),
    MenuOption(
      title: 'cheesecake',
      image: 'images/cheescake.jpg',
      routeName:
          '/cheesecake', // Add the route name for the PetitDejScreen page
      ingredients: ['biscuits', 'fromage frais', 'sucre', 'œufs'],
      recipe:
          'Mélangez les biscuits émiettés avec le beurre fondu, tapissez-en le fond d\'un moule. Mélangez le fromage frais avec le sucre et les œufs, versez sur la base biscuitée. Faites cuire 40 minutes à 150°C.',
    ),
    MenuOption(
        title: 'tiramisu',
        image: 'images/tiramusu.jpeg',
        routeName:
            '/tiramisu', // Ajouter le nom de la route pour la page Tiramisu
        ingredients: [
          'biscuits à la cuillère',
          'café',
          'mascarpone',
          'sucre',
          'œufs'
        ],
        recipe:
            'Trempez les biscuits dans le café, disposez-les dans un plat. Mélangez le mascarpone avec le sucre et les jaunes d\'œufs, puis ajoutez les blancs montés en neige. Versez cette crème sur les biscuits, puis répétez les couches. Laissez reposer au réfrigérateur pendant au moins 4 heures.'),
    MenuOption(
        title: 'gâteau au chocolat',
        image: 'images/gateauCh.jpeg',
        routeName:
            '/gateauCh', // Nom de la route pour la page de la recette du gâteau au chocolat
        ingredients: ['chocolat noir', 'beurre', 'sucre', 'œufs', 'farine'],
        recipe:
            'Faites fondre le chocolat et le beurre ensemble. Battez les œufs avec le sucre, puis ajoutez le mélange chocolat-beurre. Incorporez la farine et mélangez bien. Versez la pâte dans un moule beurré et faites cuire au four préchauffé à 180°C pendant environ 25-30 minutes.'),
    MenuOption(
        title: 'fondant',
        image: 'images/fandant.jpeg',
        routeName:
            '/fondant', // Nom de la route pour la page de la recette du gâteau au chocolat
        ingredients: ['chocolat noir', 'beurre', 'sucre', 'œufs', 'farine'],
        recipe:
            'Faites fondre le chocolat et le beurre ensemble. Battez les œufs avec le sucre, puis ajoutez le mélange chocolat-beurre. Incorporez la farine et mélangez bien. Versez la pâte dans un moule beurré et faites cuire au four préchauffé à 180°C pendant environ 25-30 minutes.'),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('desserts'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _Deconnexion(context);
            },
          ),
        ],
        backgroundColor:
           Color.fromARGB(252, 68, 193, 206), // Change the color here
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16, // Spacing between columns
          mainAxisSpacing: 16, // Spacing between rows
        ),
        itemCount: menuOptions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipePage(
                    title: menuOptions[index].title,
                    image: menuOptions[index].image,
                    ingredients: menuOptions[index].ingredients,
                    recipe: menuOptions[index].recipe,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        menuOptions[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    menuOptions[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuOption {
  final String title;
  final String image;
  final String routeName;
  final List<String> ingredients;
  final String recipe;

  MenuOption(
      {required this.title,
      required this.image,
      required this.routeName,
      required this.ingredients,
      required this.recipe});
}

Future<void> _Deconnexion(context) async {
  FirebaseAuth.instance.signOut();

  Navigator.of(context).pushNamedAndRemoveUntil(
      '/authentification', (Route<dynamic> route) => false);
}
