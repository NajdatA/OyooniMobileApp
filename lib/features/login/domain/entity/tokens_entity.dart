import 'package:equatable/equatable.dart';

class TokensEntity extends Equatable {
  final String token;
  final String refreshToken;

  TokensEntity(this.token, this.refreshToken);

  @override
  List<Object> get props => [
        token,
        refreshToken,
      ];
}
