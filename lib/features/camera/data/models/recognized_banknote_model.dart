import 'package:json_annotation/json_annotation.dart';

part 'recognized_banknote_model.g.dart';

@JsonSerializable()
class RecognizedBanknoteModel {
  static const String className = 'RecognizedBanknoteModel';

  final int bankNoteType;

  RecognizedBanknoteModel(this.bankNoteType);

  factory RecognizedBanknoteModel.fromJson(Map<String, dynamic> json) => _$RecognizedBanknoteModelFromJson(json);
}