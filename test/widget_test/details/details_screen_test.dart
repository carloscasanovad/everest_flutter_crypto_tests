import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/views/details_screen.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/convert_crypto_button.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/crypto_information.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_header.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_line_chart.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/line_chart_list_view_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsScreen is created, THEN find main widgets',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            DetailsScreen(
              cryptoDataArguments: FakeData.createCryptoDataArguments(),
              data: MarketChartViewData(prices: [
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
              ]),
            ));

        await tester.pumpAndSettle();

        expect(find.byType(SingleChildScrollView), findsOneWidget);
        expect(find.byType(DetailsHeader), findsOneWidget);
        expect(find.byType(DetailsBody), findsOneWidget);
        expect(find.byType(ConvertCryptoButton), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
      });
    },
  );
}
