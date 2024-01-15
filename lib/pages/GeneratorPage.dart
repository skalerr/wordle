import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:russian_words/russian_words.dart';
import '../main.dart';
import 'HistoryViewPage.dart';
import 'package:string_extensions/string_extensions.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pairWord: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.ToggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pairWord,
  });

  final WordPair pairWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'Caveat',
      fontStyle: FontStyle.normal,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 5,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedSize(
            duration: Duration(microseconds: 200),
            child: MergeSemantics(
              child: Wrap(
                children: [
                  Text(
                    pairWord.first.capitalize!,
                    style: style.copyWith(fontWeight: FontWeight.w200),
                  ),
                  Text(
                    " ${pairWord.second.capitalize!}",
                    style: style.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
