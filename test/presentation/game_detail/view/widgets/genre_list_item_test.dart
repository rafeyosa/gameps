import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameps/presentation/game_detail/view/widgets/genre_list_item.dart';

void main() {
  group('genre list item test', () {
    testWidgets('verify genre name', (WidgetTester tester) async {
      var mockName = 'Mock Name';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GenreListItem(name: mockName),
          ),
        ),
      );

      expect(find.text(mockName), findsOneWidget);
    });
  });
}
