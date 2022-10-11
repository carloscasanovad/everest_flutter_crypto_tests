import 'dart:convert';

class UserWalletModel {
  String id;
  double userCryptoBalance;

  UserWalletModel({
    required this.id,
    required this.userCryptoBalance,
  });

  @override
  String toString() =>
      'UserWalletModel(id: $id, userCryptoBalance: $userCryptoBalance)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'userCryptoBalance': userCryptoBalance});
  
    return result;
  }

  factory UserWalletModel.fromMap(Map<String, dynamic> map) {
    return UserWalletModel(
      id: map['id'] ?? '',
      userCryptoBalance: map['userCryptoBalance']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserWalletModel.fromJson(String source) => UserWalletModel.fromMap(json.decode(source));
}
