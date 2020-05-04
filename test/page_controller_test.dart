import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_my_sites/main.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  group('home widget tests', () {
  
  testWidgets('MyWidget tap add label -> show dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:MyHomePage()));
    await tester.enterText(find.byType(TextField).first, 'hi');
    await tester.tap(find.text("Previous"));
    //expect(find.text(formatData(DateTime.now())),findsOneWidget);
    //tester.tap(find.text("Next"));
    //tester.tap(find.text("Calendar"));
    //tester.tap(find.text("Mode"));

  });
  testWidgets('Confirm dialog -> create label', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:MyHomePage()));
    await tester.enterText(find.byType(TextField).first, 'hi');
    await tester.tap(find.text("Previous"));
    //expect(find.text(formatData(DateTime.now())),findsOneWidget);
    //tester.tap(find.text("Next"));
    //tester.tap(find.text("Calendar"));
    //tester.tap(find.text("Mode"));

  });
  testWidgets('Confirm dialog -> create page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:MyHomePage()));
    await tester.enterText(find.byType(TextField).first, 'hi');
    await tester.tap(find.text("Previous"));
    //expect(find.text(formatData(DateTime.now())),findsOneWidget);
    //tester.tap(find.text("Next"));
    //tester.tap(find.text("Calendar"));
    //tester.tap(find.text("Mode"));

  });
  testWidgets('load widget -> get pages', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:MyHomePage()));
    await tester.enterText(find.byType(TextField).first, 'hi');
    await tester.tap(find.text("Previous"));
    //expect(find.text(formatData(DateTime.now())),findsOneWidget);
    //tester.tap(find.text("Next"));
    //tester.tap(find.text("Calendar"));
    //tester.tap(find.text("Mode"));

  });
  testWidgets('change label -> load other url in webview', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:MyHomePage()));
    await tester.enterText(find.byType(TextField).first, 'hi');
    await tester.tap(find.text("Previous"));
    //expect(find.text(formatData(DateTime.now())),findsOneWidget);
    //tester.tap(find.text("Next"));
    //tester.tap(find.text("Calendar"));
    //tester.tap(find.text("Mode"));

  });
});
}