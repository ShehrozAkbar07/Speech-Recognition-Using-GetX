import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => Container(
            color: Colors.blue,
            height: 600,
            width: double.infinity,
            child: Text(
                  controller.speechText.value,
                  style: TextStyle(fontSize: 30),
                ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
            endRadius: 90.0,
            glowColor: Colors.purple,
            duration: Duration(milliseconds: 200),
            repeat: true,
            repeatPauseDuration: Duration(microseconds: 100),
            animate: controller.isListening.value,
            child: FloatingActionButton(
                onPressed: () {
                  controller.listen();



                },
                child: Icon(
                    controller.isListening.value ? Icons.mic : Icons.mic_none)),
          )),
    );
  }
}
