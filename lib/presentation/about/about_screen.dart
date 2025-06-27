import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/dev_journey.dart';
import 'package:dev_portfolio/core/widgets/dp_widget.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:dev_portfolio/presentation/about/widgets/quote_widgets.dart';
import 'package:dev_portfolio/presentation/about/widgets/timeline_widget.dart';
import 'package:dev_portfolio/presentation/mystory/mystory_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsiveLayout(
          mobile: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "About me",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7A3FFF),
                      height: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          other: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "About me",
                    style: GoogleFonts.poppins(
                      fontSize: 78.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.poppins(
                      fontSize: 78.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7A3FFF),
                      height: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        responsiveLayout(
          mobile: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  color: AppConstants.primaryColor,
                  width: 5,
                  height: 60,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My journey through code, curiosity, and a bit of chaos",
                      maxLines: 2,

                      style: GoogleFonts.poppins(
                        fontSize: 50.sp,

                        fontWeight: FontWeight.w400,
                        color: AppConstants.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          other: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  color: AppConstants.primaryColor,
                  width: 5,
                  height: 60,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My journey through code, curiosity, and a bit of chaos",

                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,

                      fontWeight: FontWeight.w400,
                      color: AppConstants.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: QuoteWidget(
            quote:
                "The darkest hour is just before the dawn.",
            author: "English Proverb",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SubHeading(label: "Milestones"),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TimelineWidget(
            timelineItems: [
              TimelineItem(
                year: "2013",
                title: "Completed SSLC",
                description: "Started dreaming about working with computers.",
              ),
              TimelineItem(
                year: "2015",
                title: "Completed +2 in Computer Science",
                description:
                    "Solidified interest in software and logic building.",
              ),
              TimelineItem(
                year: "2018",
                title: "Graduated BCA – St. Aloysius College, Mangaluru",
                description:
                    "Built my first mobile app and understood real-world dev.",
              ),
              TimelineItem(
                year: "2020",
                title: "MCA – VIT University",
                description:
                    "Expanded my horizons—personally and professionally.",
              ),
              TimelineItem(
                year: "2020",
                title: "Internship at Bluemasons",
                description: "10-month Kotlin-based mobile dev internship.",
              ),
              TimelineItem(
                year: "2021 – Present",
                title: "Working as a Flutter & Kotlin Developer",
                description: "Building fast, responsive mobile and web apps.",
              ),
            ],
          ),
        ),

        responsiveLayout(
          mobile: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SubHeading(label: "Beyond Resume", isMob: true),
          ),
          other: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SubHeading(label: "Beyond Resume"),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DeveloperJourneyInAbout(),
        ),
      ],
    );
  }
}
