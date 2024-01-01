import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RemainStatewidget extends StatelessWidget {
  final MaskItem maskItem;


  RemainStatewidget(this.maskItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(maskItem.name ?? ''),
      subtitle: Text(maskItem.addr ?? ''),
      trailing: _buildRemainState(maskItem),
      onTap: () {
        _launchUrl(maskItem.lat!.toDouble()  , maskItem.lng!.toDouble());
      }
      ,
    );

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
  Future<void> _launchUrl(double lat  , double lng) async {
    final Uri _url = Uri.parse('https://google.com/maps/search/?api=1&query=$lat,$lng');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

