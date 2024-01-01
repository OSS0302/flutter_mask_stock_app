
import 'package:flutter_mask_stock_app/dto/mask_stock_dto.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';

extension DtoToModel on Stores {
  MaskItem toMaskItem() {
    return MaskItem(
      addr: addr ?? '주소 데이터가 없습니다.',
      code: code ?? '코드 데이터가 없습니다.',
      created_at: createdAt ?? '시간 데이터 가없습니다.',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      name: name ?? '약국 데이터가 없습니다.',
      remain_stat: remainStat ?? '마스크 재고 데이터가 없습니다',
      stock_at: stockAt ?? '재고시간 데이터가 없습니다',
      type: type ?? '타입 데이터가 없습니다',
    );
  }
}
