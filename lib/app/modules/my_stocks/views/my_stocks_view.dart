import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_stocks_controller.dart';

class MyStocksView extends GetView<MyStocksController> {
  const MyStocksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyStocksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyStocksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
