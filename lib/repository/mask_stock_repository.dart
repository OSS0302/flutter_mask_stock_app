import 'package:flutter_mask_stock_app/data_source/mask_stock_api.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';

abstract class MaskItemRepository {
  Future<List<MaskItem>> getMask();
}

class MaskItemRepositoryImpl implements MaskItemRepository {
  final _api = MaskStockApi();

  @override
  Future<List<MaskItem>> getMask() async {
    final maskApiResponse = await _api.getMaskResult();
    return maskApiResponse.where((e) {
      return e.remain_stat == 'plenty' ||
          e.remain_stat == 'some' ||
          e.remain_stat == 'few' ||
          e.remain_stat == 'empty';
    }).toList();

  }
}
