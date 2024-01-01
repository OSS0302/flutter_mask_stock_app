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
        title: Text('마스크 재고있는 약국 ${viewModel.maskItem.length}'),
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
                return ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text(e.addr ?? ''),
                  trailing: Text(e.remain_stat ?? '매진 '),
                );
              }).toList(),
            ),
    );
  }

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
