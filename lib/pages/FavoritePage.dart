import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    IconData FavIcon(word) {
      IconData icon;
      if (appState.favorites.contains(word)) {
        return icon = Icons.favorite;
      } else {
        return icon = Icons.favorite_border;
      }
    }

    var favorites = appState.favorites;
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var fav in favorites)
            ListTile(
              title: Text(fav.asLowerCase),
              leading: IconButton(
                icon: Icon(
                  FavIcon(fav),
                ),
                onPressed: () {
                  appState.RemoveFavWord(fav);
                },
              ),
            )
        ],
      ),
    );
  }
}
