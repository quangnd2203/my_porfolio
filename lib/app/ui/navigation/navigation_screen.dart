import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;

import '../../blocs/theme/theme_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_values.dart';
import '../../routes/app_route_delegate.dart';
import '../../routes/app_routes.dart';
import '../widgets/custom_outline_button.dart';
import '../widgets/responsive_screen.dart';
import '../widgets/switch_button.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.child});
  final Widget child;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with ResponsiveScreen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildResponsiveScreen(context),
    );
  }

  Widget buildSwitchButton() {
    return BlocSelector<ThemeCubit, ThemeState, ThemeMode>(
      bloc: getx.Get.find<ThemeCubit>(),
      selector: (ThemeState state){
        return state.mode;
      },
      builder: (BuildContext context, ThemeMode themeMode){
        return SwitchButton(
          value: themeMode == ThemeMode.light,
          inactiveToggleWidget: const SizedBox(),
          activeToggleWidget: const SizedBox(),
          onToggle: (bool value) {
            getx.Get.find<ThemeCubit>().changeThemeMode(value ? ThemeMode.light : ThemeMode.dark);
          },
          inactiveColor: AppColors.white,
          inactiveToggleColor: Colors.black,
          activeColor: AppColors.gray.shade600,
          activeToggleColor: AppColors.white,
          height: 20,
          width: 40,
          padding: 2,
          toggleSize: 17,
        );
      },
    );
  }

  Widget buildLogo() {
    return InkWell(
      onTap: (){
        AppRouteDelegate().toNamed(Routes.account.route);
      },
      child: Text(
        '<Admin/>',
        style: AppTextStyles.get2xlPlusStyle(AppTextStyles.bold).copyWith(color: AppColors.primary),
      ),
    );
  }

  Widget buildDesktopNavigationBar() {
    return Row(
      children: <Widget>[
        buildLogo(),
        const SizedBox(
          width: 26,
        ),
        buildSwitchButton(),
        const Spacer(),
        ...buildDesktopMenu(),
        CustomOutlinedButton(title: 'contact_me'.tr,),
      ],
    );
  }

  List<Widget> buildDesktopMenu() {
    Widget buildTitle(String text, {bool isSelected = false}) {
      return Padding(
        padding: const EdgeInsets.only(right: 48),
        child: Text(
          text.tr,
          style: AppTextStyles.getBaseStyle(
            isSelected ? AppTextStyles.bold : AppTextStyles.regular,
          ).copyWith(color: isSelected ? AppColors.gray.shade600 : AppColors.gray),
        ),
      );
    }
    return NAVIGATION_MENU.map((String e) => buildTitle(e, isSelected: e == NAVIGATION_MENU.first)).toList();
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Center(
      child: Container(
        width: 1200,
        padding: const EdgeInsets.symmetric(horizontal: 104),
        child: Column(
          children: <Widget>[
            buildDesktopNavigationBar(),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }

  Widget buildMobileNavigationBar() {
    return Row(
      children: <Widget>[
        buildSwitchButton(),
        Expanded(
          child: Center(
            child: buildLogo(),
          ),
        ),
        SvgPicture.asset(AppImages.svg('navigation_setting'))
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          buildMobileNavigationBar(),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildMobile(context);
  }
}
