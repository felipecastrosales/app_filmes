import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_filmes/application/movie_app.dart';

import 'utils.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Should renders MovieApp', (tester) async {
    await tester.pumpWidget(const MovieApp());
    expect(
      find.byType(MovieApp),
      findsOneWidget,
    );
  });
}
