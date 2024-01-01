import 'package:flutter/material.dart';
import 'package:flutter_mask_stock_app/ui/mask_view_model.dart';
import 'package:flutter_mask_stock_app/ui/widget/remain_state_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MaskScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고있는 약국 : ${viewModel.maskItem.length}곳'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.getReady();
              print('리프레쉬 완료');
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? londingWidget()
          : ListView(
              children: viewModel.maskItem.map((e) {
                return RemainStatewidget(e);
              }).toList(),
            ),
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
