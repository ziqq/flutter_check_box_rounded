// Autor - <a.a.ustinoff@gmail.com> Anton Ustinoff, 11 December 2023
// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';

void main() {
  testWidgets('CheckBoxRounded initializes correctly with unchecked icon', (
    WidgetTester t,
  ) async {
    final uncheckedWidgetKey = GlobalKey();
    final uncheckedWidget = Container(
      key: uncheckedWidgetKey,
      color: Colors.red,
    );

    /// Create [CheckBoxRounded]
    await t.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CheckBoxRounded(
            uncheckedWidget: uncheckedWidget,
          ),
        ),
      ),
    );

    /// Check widget contains Widget with key `uncheckedWidgetKey`,
    /// when isChecked is `false`
    expect(find.byKey(uncheckedWidgetKey), findsOneWidget);
  });
  testWidgets('CheckBoxRounded initializes correctly', (WidgetTester t) async {
    /// Create [CheckBoxRounded]
    await t.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CheckBoxRounded(
            isChecked: true,
          ),
        ),
      ),
    );

    /// Check widget contains Icon, when [isChecked] is `true`
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('CheckBoxRounded toggles state on tap', (WidgetTester t) async {
    bool isChecked = false;

    /// Create [CheckBoxRounded]
    await t.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CheckBoxRounded(
            isChecked: isChecked,
            onTap: (value) => isChecked = value!,
          ),
        ),
      ),
    );

    /// Tap on widget and check your state
    await t.tap(find.byType(CheckBoxRounded));
    await t.pump();

    /// Check on change value `isChecked`
    expect(isChecked, isTrue);
  });
  testWidgets('CheckBoxRounded updates correctly on didUpdateWidget()', (
    WidgetTester t,
  ) async {
    /// Initialize CheckBoxRounded with [isChecked] == `false`
    await t.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CheckBoxRounded(isChecked: false),
        ),
      ),
    );

    /// Check widget [isChecked] is `false`
    expect(find.byType(Icon), findsNothing);

    /// Update [isChecked] to `true`
    await t.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CheckBoxRounded(isChecked: true),
        ),
      ),
    );

    /// Check widget is checked
    expect(find.byType(Icon), findsOneWidget);
  });
}
