import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:flutter_mask_stock_app/repository/mask_stock_repository.dart';

class MaskScreenViewModel extends ChangeNotifier {
  List<MaskItem> maskItem = [];
  final repository = MaskItemRepositoryImpl();

  Future<void> getReady () async {
    maskItem = [];
    final mask = await repository.getMask();
    maskItem.addAll(mask);
    notifyListeners(); //뷰모델에 데이터 갱신
  }

  final bool isLoading = false;
}