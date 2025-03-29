import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/widgets/search_field.dart';

void main() async {
  testWidgets('should set labelText correctly', (WidgetTester tester) async {
    const testLabelText = 'Test Label';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(labelText: testLabelText, onSearch: (_) {}),
        ),
      ),
    );

    final inputDecoratorFinder = find.byType(InputDecorator);
    expect(inputDecoratorFinder, findsOneWidget);

    final inputDecorator = tester.widget<InputDecorator>(inputDecoratorFinder);
    final decoration = inputDecorator.decoration;
    expect(decoration.labelText, testLabelText);
  });

  testWidgets('should set hintText correctly', (WidgetTester tester) async {
    const testHintText = 'Test Hint';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(hintText: testHintText, onSearch: (_) {}),
        ),
      ),
    );

    final inputDecoratorFinder = find.byType(InputDecorator);
    expect(inputDecoratorFinder, findsOneWidget);

    final inputDecorator = tester.widget<InputDecorator>(inputDecoratorFinder);
    final decoration = inputDecorator.decoration;
    expect(decoration.hintText, testHintText);
  });

  testWidgets('should set helperText correctly', (WidgetTester tester) async {
    const testHelperText = 'Test Helper';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(helperText: testHelperText, onSearch: (_) {}),
        ),
      ),
    );

    final inputDecoratorFinder = find.byType(InputDecorator);
    expect(inputDecoratorFinder, findsOneWidget);

    final inputDecorator = tester.widget<InputDecorator>(inputDecoratorFinder);
    final decoration = inputDecorator.decoration;
    expect(decoration.helperText, testHelperText);
  });

class MockOnSearch {
  String? lastQuery;

  void call(String query) {
    lastQuery = query; 
  }
}
 {
  testWidgets((WidgetTester tester) async {
    final mockOnSearch = MockOnSearch();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(hintText: testHintText, onSearch: mockOnSearch),
        ),
      ),
    );
    expect(find.text(testHintText), findsOneWidget);
  });

  testWidgets('Teste de onSearch', (WidgetTester tester) async {
    final mockOnSearch = MockOnSearch();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(hintText: 'Busca', onSearch: mockOnSearch),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), 'Flutter');
    await tester.pump();
    expect(mockOnSearch.lastQuery, equals('Flutter'));
  });
}
}
