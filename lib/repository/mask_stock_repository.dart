import 'package:flutter_mask_stock_app/data_source/mask_stock_api.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:flutter_mask_stock_app/repository/mask_stock_location_repository.dart';
import 'package:geolocator/geolocator.dart';

abstract class MaskItemRepository {
  Future<List<MaskItem>> getMask();
}

class MaskItemRepositoryImpl implements MaskItemRepository {
  final _api = MaskStockApi();
  final _maskStockLocationRepository = MaskStockLocationRepository();

  @override
  Future<List<MaskItem>> getMask() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await _maskStockLocationRepository.getCurrentLocation();

    final maskApiResponse = await _api.getMaskResult(
      position.latitude,
      position.longitude,
    );
    return maskApiResponse.where((e) {
      return e.remain_stat == 'plenty' ||
          e.remain_stat == 'some' ||
          e.remain_stat == 'few' ||
          e.remain_stat == 'empty';
    }).toList();
  }
}
