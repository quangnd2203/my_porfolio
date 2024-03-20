import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

import '../../blocs/theme/theme_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_values.dart';
import '../widgets/responsive_screen.dart';
import 'widget/home_about.dart';
import 'widget/home_projects.dart';
import 'widget/home_skill.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SizedBox(
          width: DESKTOP_PAGE_MAX_WIDTH,
          child: Row(
            children: <Widget>[
              const Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InfoCard(),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      buildPart(
                        'about',
                        const HomeAbout(),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      buildPart(
                        'my_skills',
                        const HomeSkill(),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      buildPart(
                        'my_projects',
                        const HomeProjects(),
                      ),
                    ],
                  ),
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
    return SizedBox(
      width: MOBILE_PAGE_MAX_WIDTH,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            const InfoCard(),
            const SizedBox(
              height: 24,
            ),
            buildPart(
              'about',
              const HomeAbout(),
              isMobile: true,
            ),
            const SizedBox(
              height: 24,
            ),
            buildPart(
              'my_skills',
              const HomeSkill(),
              isMobile: true,
            ),
            const SizedBox(
              height: 24,
            ),
            buildPart(
              'my_projects',
              const HomeProjects(),
              isMobile: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildDesktop(context);
  }

  Widget buildPart(String title, Widget child, {bool isMobile = false}) {
    return RepaintBoundary(
      child: BlocSelector<ThemeCubit, ThemeState, bool>(
        bloc: getx.Get.find<ThemeCubit>(),
        selector: (ThemeState state) => state.isDarkMode,
        builder: (BuildContext context, bool isDarkMode) {
          return SizedBox(
            width: isMobile ? MOBILE_PAGE_MAX_WIDTH : DESKTOP_PAGE_MAX_WIDTH,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title.tr,
                      style: (isMobile
                              ? AppTextStyles.getXsStyle(AppTextStyles.regular)
                              : AppTextStyles.getXlStyle(AppTextStyles.regular))
                          .copyWith(
                        color: isDarkMode ? AppColors.warring : AppColors.secondary.shade600,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      width: 80,
                      height: 1,
                      color: isDarkMode ? AppColors.warring.shade600 : AppColors.secondary.shade600,
                    )
                  ],
                ),
                SizedBox(
                  height: isMobile ? 12 : 36,
                ),
                child,
              ],
            ),
          );
        },
      ),
    );
  }
}
