import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeading extends StatelessWidget {
  final String label;

  final bool? isMob;
  const SubHeading({super.key, required this.label, this.isMob = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            
            style: GoogleFonts.poppins(
              fontSize: isMob == true ? 120.sp : 60.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextSpan(
            text: ".",
            style: GoogleFonts.poppins(
              fontSize: isMob == true ? 100.sp : 60.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF7A3FFF),
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
