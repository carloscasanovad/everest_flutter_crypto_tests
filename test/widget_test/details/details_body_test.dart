import 'package:everest_flutter_crypto_tests/modules/details/widgets/details_body.dart';
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
                cryptoDataArguments: FakeData.createCryptoDataArguments()));
        await tester.pumpAndSettle();
      });
    },
  );
}
