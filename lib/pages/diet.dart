import 'package:cafe_restaut/pages/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class DietPage extends StatelessWidget {
  final List<MenuOption> menuOptions = [
    MenuOption(
      title: 'Salade de quinoa',
      image: 'images/quinoa_salad.jpeg',
      routeName: '/quinoa_salad',
      ingredients: [
        'Quinoa',
        'Tomates cerises',
        'Concombre',
        'Poivron',
        'Oignon rouge',
        'Persil',
        'Jus de citron',
        'Huile d\'olive',
        'Sel et poivre'
      ],
      recipe: '''
        Faites cuire le quinoa selon les instructions sur l'emballage.
        Laissez refroidir.
        Coupez les tomates cerises, le concombre, le poivron et l'oignon rouge en dés.
        Mélangez le tout avec le quinoa refroidi.
        Ajoutez du persil frais haché, du jus de citron, de l'huile d'olive, du sel et du poivre selon votre goût.
        Servez frais.
      ''',
    ),
    MenuOption(
      title: 'Smoothie vert',
      image: 'images/green_smoothie.jpeg',
      routeName: '/green_smoothie',
      ingredients: [
        'Épinards frais',
        'Banane',
        'Avocat',
        'Ananas',
        'Jus de citron',
        'Eau de coco'
      ],
      recipe: '''
        Dans un mixeur, ajoutez une poignée d'épinards frais, une banane, un avocat, quelques morceaux d'ananas, le jus d'un citron et de l'eau de coco.
        Mixez jusqu'à obtenir une texture lisse et crémeuse.
        Ajoutez de la glace si vous le souhaitez.
        Dégustez immédiatement.
      ''',
    ),
    MenuOption(
      title: 'Bowl de quinoa et légumes grillés',
      image: 'images/quinoa_bowl.jpeg',
      routeName: '/quinoa_bowl',
      ingredients: [
        'Quinoa',
        'Courgette',
        'Aubergine',
        'Poivron rouge',
        'Oignon rouge',
        "Huile d'olive",
        'Vinaigre balsamique',
        'Miel',
        'Sel et poivre'
      ],
      recipe: '''
        Faites cuire le quinoa selon les instructions sur l'emballage.
        Coupez les légumes (courgette, aubergine, poivron rouge et oignon rouge) en dés et faites-les griller à la poêle avec un peu d'huile d'olive.
        Dans un bol, disposez le quinoa cuit et les légumes grillés.
        Pour la vinaigrette, mélangez de l'huile d'olive, du vinaigre balsamique, du miel, du sel et du poivre. Versez sur le bol.
        Mélangez délicatement et servez chaud ou froid.
      ''',
    ),
    MenuOption(
      title: 'Soupe de lentilles',
      image: 'images/lentil_soup.jpeg',
      routeName: '/lentil_soup',
      ingredients: [
        'Lentilles vertes',
        'Carottes',
        'Oignon',
        'Ail',
        'Céleri',
        'Tomates en dés',
        'Bouillon de légumes',
        'Cumin',
        'Coriandre',
        'Sel et poivre'
      ],
      recipe: '''
        Dans une grande casserole, faites revenir l'oignon, l'ail et le céleri dans un peu d'huile d'olive.
        Ajoutez les carottes coupées en dés et les lentilles vertes. Faites revenir quelques minutes.
        Versez les tomates en dés et le bouillon de légumes. Assaisonnez avec du cumin, de la coriandre, du sel et du poivre.
        Laissez mijoter pendant environ 30 minutes ou jusqu'à ce que les lentilles soient tendres.
        Servez chaud, garni de coriandre fraîche si désiré.
      ''',
    ),
    MenuOption(
      title: 'Poêlée de légumes',
      image: 'images/vegetable_stir_fry.jpeg',
      routeName: '/vegetable_stir_fry',
      ingredients: [
        'Brocoli',
        'Poivron rouge',
        'Poivron jaune',
        'Carotte',
        'Champignons',
        'Oignon',
        'Ail',
        'Sauce soja',
        'Huile de sésame',
        'Graines de sésame'
      ],
      recipe: '''
        Faites chauffer un peu d'huile de sésame dans une grande poêle ou un wok à feu moyen.
        Ajoutez l'ail et l'oignon hachés, puis les légumes coupés en morceaux (brocoli, poivrons, carottes, champignons).
        Faites sauter pendant quelques minutes jusqu'à ce que les légumes soient tendres mais encore croquants.
        Ajoutez la sauce soja et mélangez.
        Saupoudrez de graines de sésame et servez chaud.
      ''',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Recettes Diet'),
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
            Color.fromARGB(252, 68, 193, 206),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
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
              elevation: 4, // Ajoutez une élévation pour un effet de relief
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

  MenuOption({
    required this.title,
    required this.image,
    required this.routeName,
    required this.ingredients,
    required this.recipe,
  });
}

Future<void> _Deconnexion(context) async {
  FirebaseAuth.instance.signOut();

  Navigator.of(context).pushNamedAndRemoveUntil(
      '/authentification', (Route<dynamic> route) => false);
}
