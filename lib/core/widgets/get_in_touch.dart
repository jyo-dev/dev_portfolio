import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GetInTouchWidget extends StatelessWidget {
  final bool isMob;
  const GetInTouchWidget({super.key, required this.isMob});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ScreenCubit>().updateScreen(3);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Get In Touch",
            style: GoogleFonts.poppins(
              fontSize: isMob ? 8 : 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
