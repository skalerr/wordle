import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/pages/MyHomePage.dart';
import 'package:provider/provider.dart';

import 'pages/FavoritePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void ToggleAutoSkip(){
    // var e = (){
    //   for (var i = 0; i < 10; i++) {
    //     current = WordPair.random();
    //
    //   }
    // };
  }

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);

    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void ToggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void RemoveFavWord(WordPair word) {
    if (favorites.contains(word)) {
      favorites.remove(word);
      notifyListeners();
    }
  }
}
