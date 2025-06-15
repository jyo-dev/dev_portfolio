import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/mobile_appbar.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/text_button.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
      mobile: CustomAppBarDrawer(),
      other: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleName(),
          BlocBuilder<ScreenCubit, ScreenState>(
            builder: (context, state) {
              int index = 0;
              if (state is ScreenUpdated) {
                index = state.screenIndex;
              }
              return Row(
                children: [
                  CustomTextButton(
                    label: "Home",
                    onTap: () {
                      context.read<ScreenCubit>().updateScreen(0);
                    },
                    isActive: index == 0,
                  ),
                  CustomTextButton(
                    label: "Projects",
                    onTap: () {
                      context.read<ScreenCubit>().updateScreen(1);
                    },
                    isActive: index == 1,
                  ),
                  CustomTextButton(
                    label: "About",
                    onTap: () {
                      context.read<ScreenCubit>().updateScreen(2);
                    },
                    isActive: index == 2,
                  ),
                  
                ],
              );
            },
          ),

          InkWell(
            onTap: () {
              context.read<ScreenCubit>().updateScreen(3);
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppConstants.textColor,
              child: Icon(
                Icons.quickreply,
                size: 12,
                color: AppConstants.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
