import 'package:equatable/equatable.dart';

class PaginatedData<T> extends Equatable {
  final int total;
  final List<T> data;

  PaginatedData(this.total, this.data);

  @override
  List<Object> get props => [this.total, this.data];
}