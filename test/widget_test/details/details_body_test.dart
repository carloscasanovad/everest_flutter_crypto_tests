import 'package:everest_flutter_crypto_tests/modules/details/model/market_chart_view_data.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/crypto_information.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_line_chart.dart';
import 'package:everest_flutter_crypto_tests/modules/details/widgets/line_chart_list_view_buttons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/fake_data.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN detailsBody receives data, THEN find main widgets',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            DetailsBody(
              cryptoDataArguments: FakeData.createCryptoDataArguments(),
              data: MarketChartViewData(prices: [
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1]
              ]),
            ));

        await tester.pumpAndSettle();

        expect(find.byType(DetailsLineChart), findsOneWidget);
        expect(find.byType(LineChartListViewButtons), findsOneWidget);
        expect(find.byType(CryptoInformation), findsOneWidget);
      });
    },
  );
}
