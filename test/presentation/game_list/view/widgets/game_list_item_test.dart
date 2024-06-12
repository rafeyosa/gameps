import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameps/data/models/game_model.dart';

import 'package:gameps/main.dart';
import 'package:gameps/presentation/game_list/view/widgets/game_list_item.dart';

void main() {
  group('game list item test', () {
    testWidgets('verify name, release date, metascore, and rating',
        (WidgetTester tester) async {
      var mockName = 'Mock Name';
      var mockReleased = '2024-06-12';
      var mockMetacritic = 73;
      var mockRating = 4.0;

      var mockGame = GameModel(
        id: 1,
        name: mockName,
        released: mockReleased,
        tba: false,
        metacritic: mockMetacritic,
        rating: mockRating,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GameListItem(
              onTap: () {},
              game: mockGame,
            ),
          ),
        ),
      );

      final nameFinder = find.text(mockName);
      final releasedFinder = find.text('Released: $mockReleased');
      final metacriticFinder = find.text('Metascore: $mockMetacritic');
      final ratingFinder = find.text('$mockRating');

      expect(nameFinder, findsOneWidget);
      expect(releasedFinder, findsOneWidget);
      expect(metacriticFinder, findsOneWidget);
      expect(ratingFinder, findsOneWidget);
    });
  });
}
