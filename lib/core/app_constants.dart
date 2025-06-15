import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstants {
  static Color background = Color(0xffFCFCFD);
  static Color primaryColor = Color(0xff6E06F2);
  static Color textColor = Color(0xff24262F);
  static Color secondoryColor = Color(0xff4E525A);
  static Color backGroundFrame = Color(0xffB8B8B8);
  static Color backGroundFrameShade = Color.fromARGB(255, 245, 236, 253);
  static Color ribbonColor = Color(0xff6C09FD);
  static Color indicatorColor = const Color(0xFF7A3FFF);
}

Future<void> launchWebUrl(String url) async {
  final uri = Uri.tryParse(url);
  if (uri != null && await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

Widget titleName() {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Arun Jyothis",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        TextSpan(
          text: ".",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF7A3FFF),
            height: 0.9,
          ),
        ),
      ],
    ),
  );
}
