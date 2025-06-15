import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/hover_builder.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BrowseProjects extends StatelessWidget {
  final bool isMob;
  const BrowseProjects({super.key, required this.isMob});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, isHovered) {
        return InkWell(
          onTap: () {
            context.read<ScreenCubit>().updateScreen(1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),

            decoration: BoxDecoration(
              color: isHovered
                  ? AppConstants.textColor
                  : AppConstants.background,
              border: Border.all(color: AppConstants.secondoryColor),
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Browse Projects",
                style: GoogleFonts.poppins(
                  fontSize: isMob ? 8 : 12,
                  fontWeight: FontWeight.w700,
                  color: isHovered
                      ? AppConstants.background
                      : AppConstants.textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
