import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:side_panel/side_panel.dart';

void main() {
  group('SidePanel', () {
    testWidgets('should render child widget', (WidgetTester tester) async {
      // Create a simple child widget
      final childWidget = Text('Main Content');

      // Render the SidePanel with the child widget
      await tester.pumpWidget(
        MaterialApp(
          home: SidePanel(
            child: childWidget,
          ),
        ),
      );

      // Find the child widget and verify its text
      final textFinder = find.text('Main Content');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('should show right panel on clicking button',
        (WidgetTester tester) async {
      // Create a child widget and a right panel
      final childWidget = Text('Main Content');
      final rightPanel = Panel(
        child: Text('Right Panel Content'),
      );

      // Create a SidePanelController and mock its functions
      final controller = SidePanelController();
      bool isShowRightPanelCalled = false;
      controller.showRightPanel = () => isShowRightPanelCalled = true;

      // Render the SidePanel with child, right panel, and controller
      await tester.pumpWidget(
        MaterialApp(
          home: SidePanel(
            child: childWidget,
            right: rightPanel,
            controller: controller,
          ),
        ),
      );

      // Find the button to show the right panel (assuming you have one)
      final buttonFinder = find.text('Show Right Panel');
      expect(buttonFinder, findsOneWidget);

      // Tap the button
      await tester.tap(buttonFinder);
      await tester.pump();

      // Verify that showRightPanel is called on the controller
      expect(isShowRightPanelCalled, true);

      // Verify that the right panel is visible
      final rightPanelTextFinder = find.text('Right Panel Content');
      expect(rightPanelTextFinder, findsOneWidget);
    });

    testWidgets('should hide right panel on calling hideRightPanel',
        (WidgetTester tester) async {
      // Create a child widget, right panel, and controller with showRightPanel called initially
      final childWidget = Text('Main Content');
      final rightPanel = Panel(
        child: Text('Right Panel Content'),
      );
      final controller = SidePanelController();
      controller.showRightPanel(); // Simulate initial show

      // Render the SidePanel
      await tester.pumpWidget(
        MaterialApp(
          home: SidePanel(
            child: childWidget,
            right: rightPanel,
            controller: controller,
          ),
        ),
      );

      // Verify that the right panel is visible before hiding
      final rightPanelTextFinder = find.text('Right Panel Content');
      expect(rightPanelTextFinder, findsOneWidget);

      // Call hideRightPanel on the controller
      controller.hideRightPanel();
      await tester.pump();

      // Verify that the right panel is hidden
      expect(rightPanelTextFinder, findsNothing);
    });

    // Add similar tests for left, top, and bottom panels
  });
}
