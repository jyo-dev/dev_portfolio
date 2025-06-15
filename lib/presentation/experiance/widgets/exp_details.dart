import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/presentation/experiance/widgets/exp_desc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperianceDetails extends StatelessWidget {
  final String companyName;
  final String role;
  final String dateText;
  final String descOne;
  final String descTwo;
  final String descThree;
  final String link;

  const ExperianceDetails({
    super.key,
    required this.companyName,
    required this.role,
    required this.dateText,
    required this.descOne,
    required this.descTwo,
    required this.descThree,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: role,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.secondoryColor,
                ),
              ),
              TextSpan(
                text: " @ $companyName",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.primaryColor,
                  height: 0.9,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              dateText,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () {
                launchWebUrl(link);
              },
              child: Icon(
                Icons.arrow_outward_outlined,
                size: 14,
                color: AppConstants.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ExpDescription(desc: descOne),
        ExpDescription(desc: descTwo),
        ExpDescription(desc: descThree),
      ],
    );
  }
}
