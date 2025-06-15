import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/hover_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return InkWell(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isActive || isHovered
                    ? AppConstants.primaryColor
                    : Colors.grey[800],
              ),
            ),
          ),
        );
      },
    );
  }
}
