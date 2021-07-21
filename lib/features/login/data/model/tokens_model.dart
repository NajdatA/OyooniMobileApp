import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';

part 'tokens_model.g.dart';

@JsonSerializable()
class TokensModel extends TokensEntity {
  static final String className = "TokensModel";

  final String token;
  final String refreshToken;

  TokensModel(this.token, this.refreshToken) : super(
    token,
    refreshToken,
  );

  factory TokensModel.fromJson(Map<String, dynamic> json) => _$TokensModelFromJson(json);
}