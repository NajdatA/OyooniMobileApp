import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class IosState extends Equatable{
  final bool isLive;

  IosState({@required this.isLive});

  @override
  List<Object> get props => [isLive];
}