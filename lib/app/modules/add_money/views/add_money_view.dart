import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_money_controller.dart';

class AddMoneyView extends GetView<AddMoneyController> {
  const AddMoneyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddMoneyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddMoneyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
