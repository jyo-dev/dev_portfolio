import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/browse_project_widget.dart';
import 'package:dev_portfolio/core/widgets/get_in_touch.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/text_button.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        responsiveLayout(
          mobile: BlocBuilder<ScreenCubit, ScreenState>(
            builder: (context, state) {
              int index = 0;
              if (state is ScreenUpdated) {
                index = state.screenIndex;
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      launchWebUrl("https://github.com/jyo-dev");
                    },
                    child: Image.asset(
                      "assets/github.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      launchWebUrl("https://www.linkedin.com/in/thejyo-dev");
                    },

                    child: Image.asset(
                      "assets/linkedin.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: index == 2,
                    child: InkWell(
                      onTap: () {
                        launchWebUrl(
                          "https://open.substack.com/pub/arunjyothis/p/quiet-weight-of-being?utm_source=share&utm_medium=android&r=536sim",
                        );
                      },

                      child: Image.asset(
                        "assets/substack.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          other: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ScreenCubit, ScreenState>(
                builder: (context, state) {
                  int index = 0;
                  if (state is ScreenUpdated) {
                    index = state.screenIndex;
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomTextButton(
                        label: "Contact",
                        onTap: () {
                          context.read<ScreenCubit>().updateScreen(3);
                        },
                        isActive: index == 3,
                      ),
                    ],
                  );
                },
              ),

              BlocBuilder<ScreenCubit, ScreenState>(
                builder: (context, state) {
                  int index = 0;
                  if (state is ScreenUpdated) {
                    index = state.screenIndex;
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          launchWebUrl("https://github.com/jyo-dev");
                        },
                        child: Image.asset(
                          "assets/github.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          launchWebUrl(
                            "https://www.linkedin.com/in/thejyo-dev",
                          );
                        },

                        child: Image.asset(
                          "assets/linkedin.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Visibility(
                        visible: index == 2,
                        child: InkWell(
                          onTap: () {
                            launchWebUrl(
                              "https://open.substack.com/pub/arunjyothis/p/quiet-weight-of-being?utm_source=share&utm_medium=android&r=536sim",
                            );
                          },

                          child: Image.asset(
                            "assets/substack.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        responsiveLayout(
          mobile: SizedBox(height: 20),
          other: SizedBox(height: 90),
        ),
        responsiveLayout(
          mobile: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Intrested in working together?",
                    style: GoogleFonts.poppins(
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  responsiveLayout(
                    mobile: Row(
                      children: [
                        GetInTouchWidget(isMob: true),
                        SizedBox(width: 12),
                        BrowseProjects(isMob: true),
                      ],
                    ),
                    other: Row(
                      children: [
                        GetInTouchWidget(isMob: false),
                        SizedBox(width: 12),
                        BrowseProjects(isMob: false),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Made with 💜 by Arun Jyothis",
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.secondoryColor,
                    ),
                  ),

                  YourWidget(isMob: true),
                ],
              ),
            ],
          ),
          other: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Intrested in working together?",
                    style: GoogleFonts.poppins(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  responsiveLayout(
                    mobile: Row(
                      children: [
                        GetInTouchWidget(isMob: true),
                        SizedBox(width: 12),
                        BrowseProjects(isMob: true),
                      ],
                    ),
                    other: Row(
                      children: [
                        GetInTouchWidget(isMob: false),
                        SizedBox(width: 12),
                        BrowseProjects(isMob: false),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Made with 💜 by Arun Jyothis",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.secondoryColor,
                    ),
                  ),

                  YourWidget(isMob: false),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 30),
      ],
    );
  }
}

class YourWidget extends StatelessWidget {
  final bool isMob;
  final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      launchWebUrl("https://purplefolio.framer.website/");
    };

  YourWidget({super.key, required this.isMob});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Made in Flutter. Inspired from ",
            style: GoogleFonts.poppins(
              fontSize: isMob ? 6 : 10,
              fontWeight: FontWeight.w400,
              color: AppConstants.secondoryColor,
            ),
          ),
          TextSpan(
            text: "LucaDCZ.",
            style: GoogleFonts.poppins(
              fontSize: isMob ? 6 : 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7A3FFF),
              height: 0.9,
            ),
            recognizer: _tapRecognizer,
          ),
        ],
      ),
    );
  }
}
