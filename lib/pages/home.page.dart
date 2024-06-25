import 'package:cafe_restaut/pages/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  final List<MenuOption> menuOptions = [

    MenuOption(
      title: 'spaghetti',
      image: 'images/spaghetti.jpeg',
      routeName: '/spaghetti', // Add the route name for the PetitDejScreen page
      ingredients: [
        'spaghetti',
        'sauce tomate',
        'bœuf haché',
        'oignon',
        'ail',
        'huile olive'
      ],
      recipe: '''
        Faites cuire les spaghetti selon les indications sur le paquet.
        Dans une poêle, faites revenir l'oignon et l'ail dans l'huile d'olive, ajoutez la viande hachée et la sauce tomate.
        Mélangez avec les pâtes cuites.
      ''',
    ),
    MenuOption(
      title: 'pizza',
      image: 'images/pizza.jpeg',
      routeName: '/pizza', // Add the route name for the CrepeScreen page
      ingredients: [
        'pâte à pizza',
        'sauce tomate',
        'mozzarella',
        'jambon',
        'champignons',
        'origan'
      ],
      recipe: '''
        Préchauffez le four à 220°C.
        Étalez la pâte à pizza sur une plaque, tartinez de sauce tomate, disposez la mozzarella, le jambon, les champignons, saupoudrez d'origan.
        Enfournez pendant 15-20 minutes.
      ''',
    ),
    MenuOption(
      title: 'biryani',
      image: 'images/pancake.jpg',
      routeName: '/biryani', // Add the route name for the CrepeScreen page
      ingredients: [
        'riz basmati',
        'poulet',
        'oignon',
        'yaourt',
        'épices indiennes'
      ],
      recipe: '''
        Faites mariner le poulet dans du yaourt et les épices pendant quelques heures.
        Faites revenir l'oignon dans une poêle, ajoutez le poulet mariné et faites cuire.
        Dans une autre casserole, faites cuire le riz, puis mélangez avec le poulet cuit.
      ''',
    ),
    MenuOption(
  title: 'Bœuf Bourguignon',
  image: 'images/beef_bourguignon.jpeg',
  routeName: '/beef_bourguignon',
  ingredients: [
  'Viande de bœuf (type braising steak)',
  'Carottes',
  'Oignons',
  'Ail',
  'Bouquet garni (thym, laurier, persil)',
  'Vin rouge',
  'Bouillon de bœuf',
  'Champignons',
  'Beurre',
  'Farine',
  'Sel et poivre'
  ],
  recipe: '''
      Faire chauffer du beurre dans une cocotte. Ajouter la viande de bœuf coupée en morceaux et faire revenir jusqu'à ce qu'elle soit dorée. Réserver.
      Dans la même cocotte, ajouter les oignons émincés et les carottes coupées en rondelles, faire revenir quelques minutes.
      Remettre la viande dans la cocotte, saupoudrer de farine et mélanger.
      Verser le vin rouge et le bouillon de bœuf dans la cocotte. Ajouter l'ail écrasé et le bouquet garni.
      Porter à ébullition, puis réduire le feu et laisser mijoter pendant environ 2 heures, jusqu'à ce que la viande soit tendre.
      Dans une poêle, faire fondre du beurre et faire sauter les champignons jusqu'à ce qu'ils soient dorés.
      Ajouter les champignons à la cocotte et laisser mijoter encore 15 minutes.
      Assaisonner avec du sel et du poivre selon votre goût.
      Servir chaud, accompagné de pommes de terre ou de purée de pommes de terre.
    ''',
  ),
    MenuOption(
      title: 'lasagnes',
      image: 'images/lasagna.jpeg',
      routeName: '/lasagne', // Add the route name for the CrepeScreen page
      ingredients: [
        'feuilles de lasagne',
        'viande hachée',
        'sauce béchamel',
        'fromage râpé',
        'tomates',
        'ail'
      ],
      recipe: '''
        Faites revenir la viande hachée avec l'ail dans une poêle.
        Dans un plat à gratin, alternez les couches de feuilles de lasagne, de viande, de sauce béchamel, de tomates en rondelles et de fromage râpé.
        Enfournez pendant 30-35 minutes à 180°C.
      ''',
    ),
    MenuOption(
      title: 'chicken masala',
      image: 'images/chicken_masala.jpeg',
      routeName: '/chicken masala', // Add the route name for the CrepeScreen page
      ingredients: [
        'poulet',
        'oignon',
        'ail',
        'tomates',
        'épices indiennes',
        'crème fraîche'
      ],
      recipe: '''
        Faites revenir l'oignon et l'ail dans une poêle, ajoutez le poulet coupé en morceaux et faites cuire.
        Ajoutez les tomates coupées en dés et les épices, laissez mijoter.
        Incorporez la crème fraîche et servez chaud.
      ''',
    ),
    MenuOption(
      title: 'Paella',
      image: 'images/paella.jpeg',
      routeName: '/paella',
      ingredients: [
        'Riz',
        'Poulet',
        'Crevettes',
        'Moules',
        'Saucisse chorizo',
        'Poivron',
        'Oignon',
        'Tomate',
        'Ail',
        'Filaments de safran',
        'Bouillon de poulet',
        "Huile d'olive",
        'Sel et poivre'
      ],
      recipe: '''
      Chauffer de l'huile d'olive dans une grande poêle à paella à feu moyen. Ajouter l'oignon haché, le poivron et l'ail émincés, faire cuire jusqu'à ce qu'ils soient tendres.
      Ajouter le poulet coupé en dés et la saucisse chorizo tranchée, faire cuire jusqu'à ce qu'ils soient dorés.
      Incorporer les tomates hachées et le riz, faire cuire pendant quelques minutes.
      Dissoudre les filaments de safran dans le bouillon de poulet, puis verser dans la poêle.
      Disposer les crevettes, les moules et tout autre fruit de mer sur le riz.
      Couvrir et cuire jusqu'à ce que le riz soit tendre et les fruits de mer cuits.
      Servir chaud avec des quartiers de citron.
    ''',
    ),MenuOption(
      title: 'Ratatouille',
      image: 'images/ratatouille.webp',
      routeName: '/ratatouille',
      ingredients: [
        'Aubergine',
        'Courgette',
        'Poivron rouge',
        'Poivron jaune',
        'Tomates',
        'Oignon',
        'Ail',
        "Huile d'olive",
        'Herbes de Provence',
        'Sel et poivre'
      ],
      recipe: '''
      Préchauffer le four à 375°F.
      Couper les aubergines, les courgettes, les poivrons et les tomates en tranches.
      Dans un plat allant au four, disposer les tranches de légumes en alternance, en les superposant.
      Émincer l'oignon et l'ail, puis les répartir sur les légumes.
      Arroser d'huile d'olive et saupoudrer d'herbes de Provence, de sel et de poivre.
      Couvrir le plat de papier aluminium et cuire au four pendant environ 45 minutes.
      Retirer le papier aluminium et poursuivre la cuisson pendant 15 à 20 minutes, jusqu'à ce que les légumes soient tendres et légèrement dorés.
      Servir chaud en accompagnement de viande, de poisson ou de riz.
    ''',
    ),
    MenuOption(
      title: 'Couscous aux Légumes',
      image: 'images/Couscous aux Légumes.webp',
      routeName: '/vegetable_couscous',
      ingredients: [
        'Couscous',
        'Carottes',
        'Courgettes',
        'Poivrons',
        'Oignon',
        'Ail',
        'Tomates',
        'Pois chiches',
        "Huile d'olive",
        'Épices (cumin, coriandre, paprika, cannelle)',
        'Sel et poivre'
      ],
      recipe: '''
      Faire chauffer de l'huile d'olive dans une grande casserole. Faire revenir l'oignon haché et l'ail émincé jusqu'à ce qu'ils soient dorés.
      Ajouter les carottes, les courgettes et les poivrons coupés en dés. Faire cuire quelques minutes.
      Incorporer les tomates concassées, les pois chiches égouttés et les épices (cumin, coriandre, paprika, cannelle). Assaisonner avec du sel et du poivre.
      Verser suffisamment d'eau pour couvrir les légumes, porter à ébullition, puis réduire le feu et laisser mijoter pendant environ 20 minutes.
      Pendant ce temps, préparer le couscous en suivant les instructions sur l'emballage.
      Une fois les légumes cuits, servir chaud sur le couscous.
    ''',
    ),
    MenuOption(
      title: 'Poulet au Curry',
      image: 'images/chicken_curry.jpg',
      routeName: '/chicken_curry',
      ingredients: [
        'Poulet',
        'Oignon',
        'Ail',
        'Gingembre',
        'Tomates',
        'Lait de coco',
        'Curry en poudre',
        'Coriandre en poudre',
        'Cumin en poudre',
        'Piment en poudre',
        'Huile',
        'Sel et poivre'
      ],
      recipe: '''
      Chauffer de l'huile dans une grande poêle. Ajouter les oignons hachés, l'ail émincé et le gingembre râpé, faire revenir jusqu'à ce qu'ils soient dorés.
      Ajouter les morceaux de poulet et faire cuire jusqu'à ce qu'ils soient dorés de tous les côtés.
      Incorporer les tomates coupées en dés, le lait de coco et les épices (curry, coriandre, cumin, piment). Assaisonner avec du sel et du poivre.
      Laisser mijoter pendant environ 20 minutes, jusqu'à ce que le poulet soit bien cuit et la sauce épaissie.
      Servir chaud avec du riz basmati ou du pain naan.
    ''',
    ),
    // Ajoutez plus d'options de menu si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Plats'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _Deconnexion(context);
              // Action to perform when the icon is clicked
            },
          ),
        ],
        backgroundColor: Color.fromARGB(252, 68, 193, 206),
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
              elevation: 4, // Add elevation for a raised effect
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
