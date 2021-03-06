import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amrita_quizzes/common_widgets/custom_raised_button.dart';
import 'package:amrita_quizzes/common_widgets/form_submit_button.dart';

void main() {
  testWidgets('Custom Raised Button test', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(home: CustomRaisedButton(
        child: Text('tap me'),
        onPressed: () => pressed = true,
      )),
    );
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.byType(FlatButton), findsNothing);
    expect(find.text('tap me'), findsOneWidget);
    await tester.tap(button);
    expect(pressed, true);
  });

  testWidgets('Form Submit Button test', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(home: FormSubmitButton(
        key: Key("Submit"),
        text: "Submit",
        onPressed: () => pressed = true,
      )),
    );
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.byType(FlatButton), findsNothing);
    await tester.tap(button);
    expect(pressed, true);
  });
}
