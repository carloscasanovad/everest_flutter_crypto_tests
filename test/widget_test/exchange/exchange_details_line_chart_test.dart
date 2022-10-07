import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_line_chart.dart';
import 'package:everest_flutter_crypto_tests/shared/constants/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN CryptoInformationRow receives data, THEN ensure that some specific widgets exists',
    (WidgetTester tester) async {
      await loadPage(
          tester,
          DetailsLineChart(
              marketChartData: FakeData.createMarketChartViewData()));

      await tester.pumpAndSettle();

      final chartContainer =
          tester.widget<Container>(find.byKey(const Key('chartContainer')));
      expect(chartContainer.margin!.vertical, 5);

      final exchangeLineChart =
          tester.widget<LineChart>(find.byType(LineChart)).data;
      expect(exchangeLineChart.borderData.show, true);
      expect(exchangeLineChart.borderData.border.bottom.color,
          kDefaultGrey.withOpacity(0.3));
      expect(exchangeLineChart.lineBarsData.isNotEmpty, true);
      expect(exchangeLineChart.gridData.show, true);
      expect(exchangeLineChart.gridData.drawHorizontalLine, false);
      expect(exchangeLineChart.gridData.drawVerticalLine, false);

      expect(find.byType(LineChart), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
    },
  );
}
