import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:dev_portfolio/presentation/experiance/widgets/exp_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperianceScreen extends StatefulWidget {
  const ExperianceScreen({super.key});

  @override
  State<ExperianceScreen> createState() => _ExperianceScreenState();
}

class _ExperianceScreenState extends State<ExperianceScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(label: "Experience"),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company names with animated indicator.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  companyText("Sysfore", 0, () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }),
                  companyText("Riafy", 1, () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  }),
                  companyText("BlueMasons", 2, () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  }),
                ],
              ),
              const SizedBox(width: 70),
              // AnimatedSwitcher for the changing experience details.
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  // Each experience detail gets a unique key based on the selectedIndex.
                  child: selectedIndex == 0
                      ? ExperianceDetails(
                          link: "https://www.sysfore.com/",
                          key: ValueKey<int>(0),
                          companyName: "Sysfore Technologies",
                          dateText: "Dec 2021 - Present",
                          role: "Software Engineer",
                          descOne:
                              "Acted as the lead Flutter developer for a suite of enterprise apps across audit, inventory, and training domains",
                          descTwo:
                              "Translated product ideas into scalable mobile/web solutions in collaboration with UI/UX designers, PMs, and QA.",
                          descThree:
                              "Mentored junior developer and conducted regular code reviews to enforce Flutter best practices",
                        )
                      : selectedIndex == 1
                      ? ExperianceDetails(
                          link: "https://riafy.me/tech/",
                          key: ValueKey<int>(1),
                          companyName: "Riafy Technologies",
                          dateText: "Jan 2021 - Dec 2021",
                          role: "Software Developer",
                          descOne:
                              "Collaborated with backend teams to optimize API calls and implement real-time product updates.",
                          descTwo:
                              "Ensured responsive design for a wide range of screen sizes from small phones to tablets.",
                          descThree:
                              "Integrated secure checkout flows and personalized recommendation systems.",
                        )
                      : ExperianceDetails(
                          link: "https://www.bluemasons.com/",
                          key: ValueKey<int>(2),
                          companyName: "BlueMasons",
                          dateText: "Aug 2019 - Mar 2020",
                          role: "Kotlin Developer Intern",
                          descOne:
                              "Supported senior developers in building and testing Android apps using Kotlin",
                          descTwo:
                              "Contributed to feature development, bug fixing, and performance profiling.",
                          descThree:
                              "Gained experience with debugging, crash reporting tools, and clean architecture principles.",
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget companyText(String label, int index, VoidCallback onTap) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Using AnimatedContainer to animate the color and size changes for the indicator.
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          color: selectedIndex == index
              ? AppConstants.indicatorColor
              : AppConstants.secondoryColor,
          width: 4,
          height: 80,
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: selectedIndex == index
                    ? AppConstants.indicatorColor
                    : AppConstants.secondoryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ExperienceMobileView extends StatefulWidget {
  const ExperienceMobileView({super.key});

  @override
  State<ExperienceMobileView> createState() => _ExperienceMobileViewState();
}

class _ExperienceMobileViewState extends State<ExperienceMobileView> {
  final PageController _controller = PageController();

  final List<AnimatedExperienceCard> experiencesCard = [
    AnimatedExperienceCard(
      data: ExperienceModel(
        title: "Sysfore Technologies",
        role: "Software Engineer",
        dateText: "Dec 2021 - Present",
        descs: [
          "Acted as the lead Flutter developer for enterprise apps in audit, inventory, and training domains.",
          "Translated ideas into scalable mobile/web solutions in collaboration with UI/UX designers, PMs, and QA.",
          "Mentored junior developers and conducted code reviews.",
        ],
        link: "https://www.sysfore.com/",
      ),
    ),
    AnimatedExperienceCard(
      data: ExperienceModel(
        title: "Riafy Technologies",
        role: "Software Developer",
        dateText: "Jan 2021 - Dec 2021",
        descs: [
          "Worked with backend teams to optimize API calls and implement real-time product updates.",
          "Ensured responsive design across screen sizes.",
          "Integrated secure checkout flows and personalized recommendations.",
        ],
        link: "https://riafy.me/tech/",
      ),
    ),

    AnimatedExperienceCard(
      data: ExperienceModel(
        title: "BlueMasons",
        role: "Kotlin Developer Intern",
        dateText: "Aug 2019 - Mar 2020",
        descs: [
          "Supported senior devs in Android apps using Kotlin.",
          "Contributed to features, bug fixing, and profiling.",
          "Used debugging tools and learned clean architecture.",
        ],
        link: "https://www.bluemasons.com/",
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(label: "Experience", isMob: true),
          SizedBox(height: 20.h),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: experiencesCard,
          ),
        ],
      ),
    );
  }
}

class AnimatedExperienceCard extends StatelessWidget {
  final ExperienceModel data;

  const AnimatedExperienceCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        key: ValueKey(data.title),
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppConstants.backGroundFrameShade,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: GoogleFonts.poppins(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.role,
                        style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => launchWebUrl(data.link),
                          child: Icon(
                            Icons.open_in_new,
                            size: 22.sp,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Text(
                    data.dateText,
                    style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Expanded(child: SizedBox(height: 16.h)),
              ...data.descs
                  .map(
                    (desc) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          "• $desc",
                          style: GoogleFonts.poppins(fontSize: 30.sp),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceModel {
  final String title;
  final String role;
  final String dateText;
  final List<String> descs;
  final String link;

  ExperienceModel({
    required this.title,
    required this.role,
    required this.dateText,
    required this.descs,
    required this.link,
  });
}
