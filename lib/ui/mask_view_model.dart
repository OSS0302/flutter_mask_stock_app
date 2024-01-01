import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:flutter_mask_stock_app/repository/mask_stock_repository.dart';

class MaskScreenViewModel extends ChangeNotifier {
  List<MaskItem> maskItem = [];
   bool isLoading = true;
  final repository = MaskItemRepositoryImpl();

  Future<void> getReady () async {
      isLoading = true;
     notifyListeners();
    maskItem = [];
    final mask = await repository.getMask();
    maskItem.addAll(mask);
      isLoading = false;
    notifyListeners(); //뷰모델에 데이터 갱신

  }

}