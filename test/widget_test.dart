import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:com.rado.valorant/main.dart';

void main() {
  testWidgets(
    AppStrings.appName,
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
    },
  );
}
