import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

import '../../../blocs/theme/theme_cubit.dart';
import '../../../constants/constants.dart';
import '../../widgets/responsive_screen.dart';

class HomeSkill extends StatelessWidget with ResponsiveScreen {
  const HomeSkill({super.key});

  Map<String, String> get skills => <String, String>{
        'Flutter': 'for Android, iOS, Web',
        'Solidity': 'for Smart Contract - Ethereum/Binance Smart Chain',
        'NodeJS - ExpressJs': 'for REST API',
        'MongoDB, MySql, Sql Server': 'for Database',
        'Docker, Nginx': 'for DevOps'
      };

  bool get isDarkMode => getx.Get.find<ThemeCubit>().state.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      bloc: getx.Get.find<ThemeCubit>(),
      selector: (ThemeState state) {
        return state.isDarkMode;
      },
      builder: (BuildContext context, bool isDarkMode) {
        return buildResponsiveScreen(context);
      },
    );
  }

  Widget builtTitle({bool isMobile = false}) {
    return RichText(
      text: TextSpan(
        text: 'my_skills'.tr,
        style: (isMobile
            ? AppTextStyles.getLgStyle(AppTextStyles.bold)
            : AppTextStyles.getHeadingStyle(AppTextStyles.bold))
            .copyWith(color: isDarkMode ? AppColors.white : AppColors.gray.shade600),
        children: <TextSpan>[
          TextSpan(
            text: ' ${'overview'.tr}',
            style: (isMobile
                ? AppTextStyles.getLgStyle(AppTextStyles.bold)
                : AppTextStyles.getHeadingStyle(AppTextStyles.bold))
                .copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox(
      width: getx.Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          builtTitle(),
          const SizedBox(height: 32,),
        ] + skills.entries.map<Widget>((MapEntry<String, String> e) {
          return Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: e.key,
                      style: AppTextStyles.getXlStyle(AppTextStyles.medium).copyWith(color: AppColors.primary),
                    ),
                    TextSpan(
                        text: ' ${e.value}',
                        style:
                            AppTextStyles.getLgStyle(AppTextStyles.regular).copyWith(color: isDarkMode ? Colors.white : AppColors.gray.shade600)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return SizedBox(
      width: MOBILE_PAGE_MAX_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>[
          builtTitle(isMobile: true),
          const SizedBox(height: 16,),
        ] + skills.entries.map<Widget>((MapEntry<String, String> e) {
          return Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: e.key,
                      style: AppTextStyles.getBaseStyle(AppTextStyles.medium).copyWith(color: AppColors.primary),
                    ),
                    TextSpan(
                        text: ' ${e.value}',
                        style:
                            AppTextStyles.getSmStyle(AppTextStyles.regular).copyWith(color: isDarkMode ? Colors.white : AppColors.gray.shade600)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildDesktop(context);
  }
}
