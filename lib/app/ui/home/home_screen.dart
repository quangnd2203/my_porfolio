import 'package:flutter/material.dart';

import '../../constants/app_values.dart';
import '../widgets/responsive_screen.dart';
import 'widget/info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.text});
  final String text;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ResponsiveScreen {
  @override
  void initState() {
    // Future<void>.delayed(const Duration(seconds: 2), () {
    //   Get.toNamed(Routes.HOME);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: buildResponsiveScreen(context),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SizedBox(
          width: DESKTOP_PAGE_MAX_WIDTH,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InfoCard(),
                ),
              ),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const SizedBox(
      width: MOBILE_PAGE_MAX_WIDTH,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16,),
            InfoCard()
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildDesktop(context);
  }
}
