import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PersonalPortfolioApp());

    // Verify that the app loads without errors
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Verify that the name appears in the app
    expect(find.text('Abdurrahman'), findsWidgets);

    // Verify navigation elements exist
    expect(find.text('About'), findsWidgets);
    expect(find.text('Skills'), findsWidgets);
    expect(find.text('Projects'), findsWidgets);
    expect(find.text('Contact'), findsWidgets);
  });

  testWidgets('Hero section contains expected content', (WidgetTester tester) async {
    await tester.pumpWidget(const PersonalPortfolioApp());

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Check for key hero section elements
    expect(find.text('Hi, I\'m'), findsOneWidget);
    expect(find.text('Get In Touch'), findsWidgets);
    expect(find.text('Download CV'), findsWidgets);
  });

  testWidgets('App is responsive', (WidgetTester tester) async {
    // Test mobile layout
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(const PersonalPortfolioApp());
    await tester.pumpAndSettle();

    // Verify mobile layout works
    expect(find.byType(MaterialApp), findsOneWidget);

    // Test desktop layout
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpWidget(const PersonalPortfolioApp());
    await tester.pumpAndSettle();

    // Verify desktop layout works
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}