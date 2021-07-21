import 'package:senior_project/core/Basic/Entity/stripe_secret.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'stripe_secret_model.g.dart';
@JsonSerializable()
class StripeSecretModel extends StripeSecret{
  static final String className = "StripeSecretModel";
  final String clientSecret;

  StripeSecretModel({@required this.clientSecret});
  factory StripeSecretModel.fromJson(Map<String, dynamic> json) => _$StripeSecretModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripeSecretModelToJson(this);
}