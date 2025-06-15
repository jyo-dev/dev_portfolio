// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:dev_portfolio/presentation/projects/widgets/curved_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dev_portfolio/core/app_constants.dart';

class ProjectCard extends StatelessWidget {
  final String projectName;
  final int projectIndex;
  final String smallDesc;
  final bool isMob;
  final List<String> projectSSList;
  const ProjectCard({
    super.key,
    required this.projectName,
    required this.smallDesc,
    required this.projectIndex,
    required this.projectSSList,
    this.isMob = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppConstants.backGroundFrame,
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          child: ClipRect(
            child: CustomPaint(
              painter: CurvedLinePainter(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: isMob
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: projectSSList
                            .map(
                              (imagePath) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(imagePath),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: projectSSList
                            .map(
                              (imagePath) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(imagePath),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: projectName,
                    style: GoogleFonts.poppins(
                      fontSize: isMob ? 60.sp : 40.sp,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.textColor, // Purple
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                context.read<ScreenCubit>().updateScreen(
                  1,
                  projectIndex: projectIndex,
                );
              },
              child: CircleAvatar(
                backgroundColor: AppConstants.indicatorColor,
                radius: 10,
                child: CircleAvatar(
                  backgroundColor: AppConstants.background,
                  radius: 8,
                  child: Icon(
                    Icons.arrow_outward,
                    color: AppConstants.indicatorColor,
                    size: 8,
                    weight: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        Text(
          smallDesc,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 40.sp : 20.sp,
            fontWeight: FontWeight.w400,
            color: AppConstants.secondoryColor,
          ),
        ),
      ],
    );
  }
}
