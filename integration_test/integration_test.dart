import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:deliveristo_test/main.dart' as app_main;
import 'package:deliveristo_test/core/services/api_services.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late BreedsServices services;
  setUp(() {
    services = BreedsServices();
  });
  group('E2E test with internet connection', () {
    test('REST call for every call', () async {
      final response = services.fetchData('breeds/list/all');
      expect(response, isNotNull);
    });
    testWidgets('Verify Random Image', (widgetTester) async {
      app_main.main();

      await widgetTester.pumpAndSettle();
      final Finder dropDownButton =
          find.byKey(const Key('downloadedBreedList'));
      await widgetTester.tap(dropDownButton);
      await widgetTester.pumpAndSettle();

      final Finder dropDownItem = find.text('African').first;
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(dropDownItem);
      await widgetTester.pumpAndSettle();

      final randomButton = find.byKey(const Key('Random Button'));
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(randomButton);
      await widgetTester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
      expect(find.byKey(const Key('RandomImageCached')), findsOneWidget);
    });
  });
}
