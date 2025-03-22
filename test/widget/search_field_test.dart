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
testWidgets('should trigger onSearch when Enter key is pressed', (WidgetTester tester) async {
  String? searchText;

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SearchField(
          onSearch: (text) => searchText = text,
        ),
      ),
    ),
  );

  await tester.enterText(find.byType(TextFormField), 'Testing submission');
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();

  expect(searchText, 'Testing submission');
});

testWidgets('should set initial text correctly', (WidgetTester tester) async {
  const initialText = 'Initial Value';

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SearchField
        (
          initialText: initialText,
          onSearch: (_) {},
        ),
      ),
    ),
  );

  final textField = find.byType(TextFormField);
  final textFieldWidget = tester.widget<TextFormField>(textField);
  expect(textFieldWidget.controller?.text, initialText);
});

testWidgets('should show validation error when input is invalid', (WidgetTester tester) async {
  String? errorMessage;

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Form(
          child: SearchField(
            onSearch: (_) {},
            validator: (text) {
              if (text == null || text.isEmpty) {
                errorMessage = 'Campo obrigatório';
                return errorMessage;
              }
              return null;
            },
          ),
        ),
      ),
    ),
  );

  await tester.tap(find.byIcon(Icons.search));
  await tester.pump();

  expect(find.text('Campo obrigatório'), findsOneWidget);
});

  
}

  
}
