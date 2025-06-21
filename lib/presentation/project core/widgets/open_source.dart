import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/hover_builder.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenSourceWidget extends StatelessWidget {
  const OpenSourceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsiveLayout(
          other: SubHeading(label: "Open Source Contributions"),
          mobile: SubHeading(label: "Open Source Contributions", isMob: true),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            HoverBuilder(
              builder: (context, isHovered) {
                return Container(
                  decoration: BoxDecoration(
                    color: isHovered
                        ? AppConstants.primaryColor
                        : AppConstants.backGroundFrameShade,
                    border: Border.all(
                      color: AppConstants.primaryColor,

                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        launchWebUrl(
                          'https://pub.dev/packages/flashlight_control',
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isHovered
                                  ? AppConstants.ribbonColor
                                  : AppConstants.backGroundFrame,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: responsiveLayout(
                                mobile: SvgPicture.asset(
                                  'assets/pub-dev-logo.svg',
                                  width: 6,
                                  height: 6,
                                  fit: BoxFit.fill,
                                ),
                                other: SvgPicture.asset(
                                  'assets/pub-dev-logo.svg',
                                  width: 10,
                                  height: 10,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          responsiveLayout(
                            mobile: Text(
                              "🔦 flashlight_control",
                              style: GoogleFonts.poppins(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                                color: isHovered
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                            other: Text(
                              "🔦 flashlight_control",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: isHovered
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 10.w),
            SizedBox(), // Placeholder for future contributions)
          ],
        ),
      ],
    );
  }
}
