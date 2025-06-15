import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/browse_project_widget.dart';
import 'package:dev_portfolio/core/widgets/get_in_touch.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hey, I'm Luca 👋🏻
          Text(
            "Hey, I'm Arun 👋🏻",
            style: GoogleFonts.poppins(
              fontSize: 40.h,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),

          // Frontend Developer (split color)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Front",
                  style: GoogleFonts.poppins(
                    fontSize: 88.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7A3FFF), // Purple
                  ),
                ),
                TextSpan(
                  text: "end\nDeveloper",
                  style: GoogleFonts.poppins(
                    fontSize: 88.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // I'm a frontend developer based in Italy...
          Text(
            "I craft user-loved websites and mobile apps from India. Explore my portfolio to see how I bring ideas to life.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
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
    );
  }
}
