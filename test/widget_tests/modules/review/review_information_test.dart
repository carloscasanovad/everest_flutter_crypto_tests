import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_tests/modules/review/widgets/review_information.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_crypto_data_view_data.dart';
import '../../../helpers/setup_widget_tester.dart';

main() {
  Future<void> loadPage(WidgetTester tester,
      {required ReviewArguments reviewArguments}) async {
    var reviewInformation = SetupWidgetTester(
      child: ReviewInformation(
        reviewArguments: reviewArguments,
      ),
    );
    await tester.pumpWidget(reviewInformation);
  }

  testWidgets(
    'description',
    (WidgetTester tester) async {
      FakeCryptoDataRepository fakeData = FakeCryptoDataRepository();
      ReviewArguments reviewArguments = ReviewArguments(
        cryptoToExchangeValue: faker.currency.random.decimal(scale: 15, min: 1),
        cryptoToExchangeData: fakeData.getData(),
        cryptoBeingExchangedValue:
            faker.currency.random.decimal(scale: 15, min: 1),
        cryptoBeingExchangeData: fakeData.getData(),
      );
      loadPage(tester, reviewArguments: reviewArguments);
      
    },
  );
}
