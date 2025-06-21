import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientLogosSection extends StatelessWidget {
  const ClientLogosSection({super.key});

  // Define a list of maps, where each map contains the logo path and the URL
  final List<Map<String, String>> companyLogos = const [
    {
      'path': 'assets/besix-group.png',
      'url': 'https://www.besix.com/en', // Replace with actual URL
    },
    {
      'path': 'assets/bajaj.png',
      'url': 'https://www.bajajauto.com/', // Replace with actual URL
    },
    {
      'path': 'assets/chaitanya.jpg',
      'url': 'https://www.chaitanyaindia.in/', // Replace with actual URL
    },
    {
      'path': 'assets/metro__logo.png',
      'url': 'https://www.metro.co.in/', // Replace with actual URL
    },
    {
      'path': 'assets/nesto.jpg',
      'url': 'https://nestogroup.com/', // Replace with actual URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Companies I’ve worked with",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7A3FFF),
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "(via Riafy & Sysfore)",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: companyLogos.map((logoData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Wrap with InkWell for tap functionality
                  onTap: () =>
                      launchWebUrl(logoData['url']!), // Call _launchUrl on tap
                  child: Image.asset(
                    logoData['path']!, // Get the image path
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      other: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Companies I’ve worked with",
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7A3FFF),
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "(via Riafy & Sysfore)",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: companyLogos.map((logoData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  // Wrap with InkWell for tap functionality
                  onTap: () =>
                      launchWebUrl(logoData['url']!), // Call _launchUrl on tap
                  child: Image.asset(
                    logoData['path']!, // Get the image path
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
