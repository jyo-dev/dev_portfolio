import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/custom_app_bar.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/presentation/about/about_screen.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:dev_portfolio/presentation/contact/contact_screen.dart';
import 'package:dev_portfolio/presentation/experiance/experiance_screen.dart';
import 'package:dev_portfolio/presentation/footer/footer_screen.dart';
import 'package:dev_portfolio/presentation/home/home_screen.dart';
import 'package:dev_portfolio/presentation/mystory/mystory_screen.dart';
import 'package:dev_portfolio/presentation/project%20core/main_project_screen.dart';
import 'package:dev_portfolio/presentation/projects/projects_home.dart';
import 'package:dev_portfolio/presentation/skills/skills_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.background,
      body: responsiveWrapper(
        child: BlocListener<ScreenCubit, ScreenState>(
          listener: (context, state) {
            if (state is ScreenUpdated) {
              if (state.isScrollPositionMentioned == true) {
                _scrollToTop(52);
                return;
              }
            }

            _scrollToTop(0);
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<ScreenCubit, ScreenState>(
                builder: (context, state) {
                  int index = 0;
                  int projectIndex = 0;
                  bool isScrollMentioned = false;
                  if (state is ScreenUpdated) {
                    index = state.screenIndex;
                    projectIndex = state.projectIndex;
                    isScrollMentioned =
                        state.isScrollPositionMentioned ?? false;
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // The App Bar is defined once.
                          const CustomAppBar(),

                          responsiveLayout(
                            mobile: SizedBox(),
                            other: const SizedBox(height: 90),
                          ),

                          // AnimatedSwitcher only rebuilds the changing middle content.
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            // Unique key to trigger transition when layout changes.
                            child: _getLayout(
                              index,
                              projectIndex: projectIndex,
                              isScrollPostionMentioned: isScrollMentioned,
                              key: ValueKey<int>(index),
                            ),
                          ),

                          responsiveLayout(
                            mobile: SizedBox(height: 20),
                            other: const SizedBox(height: 90),
                          ),

                          // The Footer is defined once.
                        ],
                      ),
                      const FooterScreen(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns only the central changing layout for a given index.
  Widget _getLayout(
    int index, {
    int projectIndex = 0,
    bool? isScrollPostionMentioned,
    Key? key,
  }) {
    if (index == 1) {
      return Container(
        key: key,
        child: MainProjectScreen(
          projectIndex: projectIndex,
          isScrollPositionMentioned: isScrollPostionMentioned,
        ),
      );
    } else if (index == 2) {
      return Container(key: key, child: const AboutScreen());
    } else if (index == 3) {
      return Container(key: key, child: const ContactScreen());
    } else {
      // If none of the above, return a "home" screen with multiple sections.
      return Container(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreen(),
            responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 90)),
            ProjectsHome(),
            responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 90)),
            responsiveLayout(
              mobile: SizedBox(height: 250, child: ExperienceMobileView()),
              other: ExperianceScreen(),
            ),
            responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 90)),
            SkillsScreen(),
            responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 90)),
            MyStoryScreen(),
          ],
        ),
      );
    }
  }
}
