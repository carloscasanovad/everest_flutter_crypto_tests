import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/line_chart_button_widget.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/line_chart_list_view_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN LineChartListViewButtons is created, THEN validate if some widgets exists',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          LineChartListViewButtons(
            marketChartdata: MarketChartViewData(prices: []),
          ));

      await tester.pumpAndSettle();

      final lineChartButtonsSizedBox = tester
          .widget<SizedBox>(find.byKey(const Key('lineChartButtonsSizedBox')));
      expect(lineChartButtonsSizedBox.height, 38);

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(LineChartButtonWidget), findsWidgets);
    },
  );
}
