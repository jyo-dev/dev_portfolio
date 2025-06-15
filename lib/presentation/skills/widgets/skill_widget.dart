import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillWidgets extends StatelessWidget {
  final String skillName;
  final List<String> skills;
  const SkillWidgets({
    super.key,
    required this.skillName,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsiveLayout(
          other: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: skillName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textColor, // Purple
                  ),
                ),
              ],
            ),
          ),
          mobile: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: skillName,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textColor, // Purple
                  ),
                ),
              ],
            ),
          ),
        ),
        responsiveLayout(
          mobile: SizedBox(height: 0),
          other: SizedBox(height: 20),
        ),
        skillText(skills[0]),
        skillText(skills[1]),
        skillText(skills[2]),
        skillText(skills[3]),
      ],
    );
  }

  Widget skillText(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: responsiveLayout(
        mobile: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
        other: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
