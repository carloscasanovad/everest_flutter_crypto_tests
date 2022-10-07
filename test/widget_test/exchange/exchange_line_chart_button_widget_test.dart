import 'package:everest_flutter_crypto_tests/modules/details/widgets/line_chart_button_widget.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN LineChartButtonWidget is created, THEN validate if some widgets exists',
    (WidgetTester tester) async {
      int dayRange = 5;
      await loadPage(tester, LineChartButtonWidget(dayRange: dayRange));

      await tester.pumpAndSettle();

      final dayRangeText = tester.widget<Text>(find.text('${dayRange}D'));
      expect(dayRangeText.data, '${dayRange}D');
      expect(dayRangeText.style!.fontSize, 14);

      final lineChartContainer =
          tester.widget<Container>(find.byKey(const Key('lineChartContainer')));
      expect(lineChartContainer.margin!.horizontal, 10);
      expect(lineChartContainer.margin!.vertical, 17);

      final lineChartButton = tester.widget<MaterialButton>(
          find.byKey(const Key('lineChartMaterialButton')));
      expect(lineChartButton.elevation, 0);
      expect(lineChartButton.padding!.horizontal, 2);
      expect(lineChartButton.padding!.vertical, 2);
      expect(lineChartButton.color, kDefaultFlowButtonColor);
    },
  );
}
