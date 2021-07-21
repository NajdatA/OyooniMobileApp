import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class StripeSecret extends Equatable {
final String clientSecret ;

StripeSecret({@required this.clientSecret
  });

  @override
  List<Object> get props =>
      [clientSecret];
}