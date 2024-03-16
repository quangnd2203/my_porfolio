import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../blocs/theme/theme_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_values.dart';
import '../../widgets/custom_outline_button.dart';

class DesktopInfoCard extends StatelessWidget {
  const DesktopInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      bloc: Get.find<ThemeCubit>(),
      selector: (ThemeState state) => state.isDarkMode,
      builder: (BuildContext context, bool isDarkMode) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxHeight <= DESKTOP_PAGE_MAX_HEIGHT) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                child: buildInfoCard(context, isDarkMode),
              );
            }
            return buildInfoCard(context, isDarkMode);
          },
        );
      },
    );
  }

  Widget buildInfoCard(BuildContext context, bool isDarkMode) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.primary.withOpacity(0.15),
                offset: const Offset(4, 4),
                blurRadius: 12,
              )
            ],
          ),
          child: Container(
            width: 460,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
            ),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 28,
              ),
              Image.asset(AppImages.png('demo_avatar')),
              const SizedBox(
                height: 24,
              ),
              Text(
                '< Ariful Islam />',
                style: AppTextStyles.get2xlPlusStyle(AppTextStyles.bold).copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Flutter Developer',
                style: AppTextStyles.getXlStyle(AppTextStyles.regular).copyWith(color: isDarkMode ? AppColors.warring : AppColors.secondary),
              ),
              buildSocials(isDarkMode),
              const SizedBox(
                height: 49,
              ),
              CustomOutlinedButton(
                title: 'hire_me'.tr,
                textStyle: AppTextStyles.get2xlPlusStyle(AppTextStyles.bold).copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              buildBottom(isDarkMode),
            ]),
          ),
        ),
      ],
    );
  }

  Widget buildSocials(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            AppImages.svg('Github'),
            color: isDarkMode ? AppColors.white : AppColors.gray.shade600,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            AppImages.svg('Linkedin'),
            color: isDarkMode ? AppColors.white : AppColors.gray.shade600,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            AppImages.svg('Facebook'),
            color: isDarkMode ? AppColors.white : AppColors.gray.shade600,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBottom(bool isDarkMode) {
    Widget buildTitle(String text, String icon) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text.tr,
            style: AppTextStyles.getXlStyle(AppTextStyles.bold).copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            AppImages.svg(icon),
            width: 30,
            height: 20,
            fit: BoxFit.fill,
            color: isDarkMode ? AppColors.white : AppColors.gray.shade600,
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
        border: Border.all(
          color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
        ),
        color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: buildTitle(
                  'download_cv',
                  'download',
                ),
              ),
            ),
            Container(
              width: 1,
              height: 76,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
                ),
                color: isDarkMode ? AppColors.white.withOpacity(0.1) : AppColors.primary.withOpacity(0.15),
              ),
            ),
            Expanded(
              child: Center(
                child: buildTitle(
                  'contact_me',
                  'comment',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}