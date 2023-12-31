import 'package:json_annotation/json_annotation.dart';

part 'mask_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MaskItem {

  String? addr;
  String? code;
  String? created_at;
  num? lat;
  num? lng;
  String? name;
  String? remain_stat;
  String? stock_at;
  String? type;

  MaskItem({
    this.addr,
    this.code,
    this.created_at,
    this.lat,
    this.lng,
    this.name,
    this.remain_stat,
    this.stock_at,
    this.type,
  });

  factory MaskItem.fromJson(Map<String, dynamic> json) => _$MaskItemFromJson(json);

  Map<String, dynamic> toJson() => _$MaskItemToJson(this);


}