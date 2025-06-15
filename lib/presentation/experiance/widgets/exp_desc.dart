import 'package:dev_portfolio/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpDescription extends StatelessWidget {
  final String desc;
  const ExpDescription({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.check, size: 20, color: AppConstants.primaryColor),
        ),
        Text(
          desc,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
