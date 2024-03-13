import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../routes/app_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.text});
  final String text;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // Future<void>.delayed(const Duration(seconds: 2), () {
    //   Get.toNamed(Routes.HOME);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Image.asset(
        //   AppImages.png('logo'),
        //   scale: 1.5,
        // ),
        child: Text(widget.text),
      ),
    );
  }
}
