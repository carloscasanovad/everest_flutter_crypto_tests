import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class CryptoDataViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double market_cap_change_percentage_24h;
  CryptoDataViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap_change_percentage_24h,
  });

  @override
  String toString() {
    return 'CryptoDataViewData(id: $id, symbol: $symbol, name: $name, image: $image, current_price: $current_price, market_cap_change_percentage_24h: $market_cap_change_percentage_24h)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': current_price});
    result.addAll(
        {'market_cap_change_percentage_24h': market_cap_change_percentage_24h});

    return result;
  }

  factory CryptoDataViewData.fromMap(Map<String, dynamic> map) {
    return CryptoDataViewData(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      current_price: map['current_price']?.toDouble() ?? 0.0,
      market_cap_change_percentage_24h:
          map['market_cap_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDataViewData.fromJson(String source) =>
      CryptoDataViewData.fromMap(json.decode(source));
}
