import '../../wallet/model/crypto_data_view_data.dart';

class CryptoDataArguments {
  CryptoDataViewData crypto;
  double cryptoBalance;
  double cryptoValue;
  CryptoDataArguments({
    required this.crypto,
    required this.cryptoBalance,
    required this.cryptoValue,
  });
}
