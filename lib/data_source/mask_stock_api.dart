import 'dart:convert';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:http/http.dart'as http;
class MaskStockApi {
  Future<List<MaskItem>> getMaskResult(double lat, double lng) async {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=$lat&lng'));
    print('print Get');
    print(response.body.toString());
    final jsonList = jsonDecode(response.body)['stores'] as List<dynamic>;
    return jsonList.map((e) => MaskItem.fromJson(e)).toList();
  }
}