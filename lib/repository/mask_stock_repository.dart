import 'package:flutter_mask_stock_app/data_source/mask_stock_api.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';

abstract class MaskItemRepository {
  Future<List<MaskItem>> getMask();
}

class MaskItemRepositoryImpl implements MaskItemRepository {
  final _api = MaskStockApi();

  @override
  Future<List<MaskItem>> getMask() {
    final maskApiResponse = _api.getMaskResult();
    return maskApiResponse;

  }
}
