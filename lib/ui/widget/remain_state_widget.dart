import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';

class RemainStatewidget extends StatelessWidget {
  final MaskItem maskItem;

  RemainStatewidget(this.maskItem);

  @override
  Widget build(BuildContext context) {
    return _buildRemainState(maskItem);
  }
  // 마스크 갯수 로 나누기
  Widget _buildRemainState(MaskItem maskItem) {

    var remainState = '판매중지';
    var descrpition = '판매중지';
    var color = Colors.black;
    if (maskItem.remain_stat == 'plenty') {
      var remainState = '충분';
      var descrpition = '100개';
      var color = Colors.green;
    }
    switch (maskItem.remain_stat) {
      case 'plenty':
        remainState = '충분';
        descrpition = '100개이상 ';
        color = Colors.green;
        break;
      case 'some':
        remainState = '보통';
        descrpition = '30개 ~ 100개 ';
        color = Colors.yellow;
        break;
      case 'few':
        remainState = '부족';
        descrpition = '2 ~30개 ';
        color = Colors.orange;
        break;
      case 'empty':
        remainState = '소진임박';
        descrpition = '1개 이하 ';
        color = Colors.red;
        break;

      default:
    }

    return Column(
      children: [
        Text(
          remainState,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(descrpition, style: TextStyle(color: color, fontSize: 16)),
      ],
    );
  }
}
