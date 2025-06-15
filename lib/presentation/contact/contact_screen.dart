import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/dp_widget.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(label: "Get In Touch", isMob: true),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "For partnerships or opportunities,\nreach out directly using the details below.\nI'll respond within 48 hours.",
                  style: GoogleFonts.poppins(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.secondoryColor,
                  ),
                ),
              ),
              contact(
                "mail.jyothisarun@gmail.com",
                Icons.mail_outline,
                isMob: true,
              ),
              contact("+91 8921654709", Icons.phone, isMob: true),
              InkWell(
                onTap: () {
                  launchWebUrl(
                    "https://drive.google.com/drive/folders/1fec7Ij0HW-FKe2qUOz9g6Rxiubku-SK2?usp=sharing",
                  );
                },
                child: contact(
                  "Download Resume",
                  Icons.picture_as_pdf,
                  isResume: true,
                  isMob: true,
                ),
              ),
            ],
          ),
        ],
      ),
      other: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(label: "Get In Touch"),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "For partnerships or opportunities,\nreach out directly using the details below.\nI'll respond within 48 hours.",
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.secondoryColor,
                  ),
                ),
              ),
              contact("mail.jyothisarun@gmail.com", Icons.mail_outline),
              contact("+91 8921654709", Icons.phone),
              InkWell(
                onTap: () {
                  launchWebUrl(
                    "https://drive.google.com/drive/folders/1fec7Ij0HW-FKe2qUOz9g6Rxiubku-SK2?usp=sharing",
                  );
                },
                child: contact(
                  "Download Resume",
                  Icons.picture_as_pdf,
                  isResume: true,
                ),
              ),
            ],
          ),
          DpWidget(),
        ],
      ),
    );
  }

  Widget contact(
    String content,
    IconData icon, {
    bool isResume = false,
    bool isMob = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppConstants.secondoryColor,
            radius: isMob ? 25.r : 18.r,
            child: CircleAvatar(
              backgroundColor: AppConstants.background,
              radius: isMob ? 25.r : 18.r,
              child: Icon(icon, size: 11, color: AppConstants.secondoryColor),
            ),
          ),
          SizedBox(width: 20),
          isResume
              ? Text(
                  content,

                  style: GoogleFonts.poppins(
                    fontSize: isMob ? 30.sp : 19.sp,
                    fontWeight: FontWeight.w400,
                    color: isResume
                        ? AppConstants.primaryColor
                        : AppConstants.secondoryColor,
                  ),
                )
              : SelectableText(
                  content,

                  style: GoogleFonts.poppins(
                    fontSize: isMob ? 30.sp : 19.sp,
                    fontWeight: FontWeight.w400,
                    color: isResume
                        ? AppConstants.primaryColor
                        : AppConstants.secondoryColor,
                  ),
                ),
        ],
      ),
    );
  }
}
