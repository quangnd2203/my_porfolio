import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

import '../../../blocs/theme/theme_cubit.dart';
import '../../../constants/constants.dart';
import '../../widgets/responsive_screen.dart';

class HomeAbout extends StatelessWidget with ResponsiveScreen {
  const HomeAbout({super.key});

  bool get isDarkMode => getx.Get.find<ThemeCubit>().state.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, ThemeMode>(
      bloc: getx.Get.find<ThemeCubit>(),
      selector: (ThemeState state) {
        return state.mode;
      },
      builder: (BuildContext context, ThemeMode themeMode) {
        return buildResponsiveScreen(context);
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox(
      width: getx.Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildName(),
          const SizedBox(height: 32),
          buildSayHi(),
          const SizedBox(height: 56),
          buildAchievements(),
        ],
      ),
    );
  }

  Widget buildName({bool isMobile = false}) {
    return RichText(
      text: TextSpan(
        text: 'i_am'.tr,
        style: (isMobile
                ? AppTextStyles.getLgStyle(AppTextStyles.bold)
                : AppTextStyles.getHeadingStyle(AppTextStyles.bold))
            .copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
        children: <TextSpan>[
          TextSpan(
            text: ' Nguyen Dang Quang',
            style: (isMobile
                    ? AppTextStyles.getLgStyle(AppTextStyles.bold)
                    : AppTextStyles.getHeadingStyle(AppTextStyles.bold))
                .copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget buildSayHi({bool isMobile = false}) {
    return Text(
      "I'm a Full Stack Developer with a passion for creating dynamic web solutions. I specialize in both front-end and back-end development, crafting user-friendly interfaces and building robust server-side systems. With a strong foundation in languages and frameworks, I thrive on turning ideas into functional, efficient code. I'm dedicated to continuous learning, staying current with industry trends, and collaborating with teams to deliver exceptional results. Let's work together to bring your digital projects to life!",
      style:
          (isMobile ? AppTextStyles.getSmStyle(AppTextStyles.regular) : AppTextStyles.getXlStyle(AppTextStyles.regular))
              .copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
      textAlign: TextAlign.justify,
    );
  }

  Widget buildAchievements({bool isMobile = false}) {
    Widget buildItem(String value, String title) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
          ),
          color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                value,
                style: (isMobile
                        ? AppTextStyles.get2xlPlusStyle(AppTextStyles.bold)
                        : AppTextStyles.getHeadingStyle(AppTextStyles.bold))
                    .copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title.tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: (isMobile
                    ? AppTextStyles.getXlStyle(AppTextStyles.medium)
                    : AppTextStyles.get2xlStyle(AppTextStyles.medium)).copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: buildItem('4+', 'year_of_experience'),
        ),
        SizedBox(
          width: isMobile ? 16 : 32,
        ),
        Expanded(
          child: buildItem('23', 'projects_completed'),
        ),
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return SizedBox(
      width: MOBILE_PAGE_MAX_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildName(isMobile: true),
          const SizedBox(height: 16),
          buildSayHi(isMobile: true),
          const SizedBox(
            height: 24,
          ),
          buildAchievements(isMobile: true),
        ],
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildDesktop(context);
  }
}
