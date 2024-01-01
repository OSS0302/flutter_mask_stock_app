import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/model/mask_item.dart';
import 'package:flutter_mask_stock_app/repository/mask_stock_repository.dart';
import 'package:flutter_mask_stock_app/ui/mask_view_model.dart';
import 'package:provider/provider.dart';

class MaskScreen extends StatefulWidget {
  const MaskScreen({super.key});

  @override
  State<MaskScreen> createState() => _MaskScreenState();
}

class _MaskScreenState extends State<MaskScreen> {
  @override
  void initState() {
    super.initState();

    getReady();
  }

  getReady() async {
    Future.microtask(() async {
      final viewModel = context.read<MaskScreenViewModel>();
      await viewModel.getReady();
      setState(() {});
    });
  }

  MaskItem maskItem = MaskItem();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MaskScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고있는 약국 : ${viewModel.maskItem.where((e) {
          return e.remain_stat == 'plenty' ||
              e.remain_stat == 'some' ||
              e.remain_stat == 'few' ||
              e.remain_stat == 'empty';
        }).length}곳'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                viewModel.getReady();
                print('리프레쉬 완료');
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? londingWidget()
          : ListView(
              children: viewModel.maskItem.where((e) {
                return e.remain_stat == 'plenty' ||
                    e.remain_stat == 'some' ||
                    e.remain_stat == 'few' ||
                    e.remain_stat == 'empty';
              }).map((e) {
                return ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text(e.addr ?? ''),
                  trailing: _buildRemainState(e),
                );
              }).toList(),
            ),
    );
  }

  // 마스크 갯수 로 나누기
  Widget _buildRemainState(MaskItem maskItem) {
    final viewModel = context.watch<MaskScreenViewModel>();

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
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(descrpition, style: TextStyle(color: color)),
      ],
    );
  }

// 로딩 위젯
  Widget londingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중입니다'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
