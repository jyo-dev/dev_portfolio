import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/hover_builder.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:dev_portfolio/presentation/projects/widgets/curved_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedProjects extends StatelessWidget {
  final String projectName;
  final String projectDesc;
  final bool isMobProject;
  final List<String> projectSSList; // Updated here
  final String client;
  final String role;
  final String year;
  final String aboutProject;
  final String aboutClient;
  final String challenges;
  final bool isExpanded;
  final VoidCallback readMoreClicked;
  final VoidCallback collapseClicked;

  const DetailedProjects({
    super.key,
    required this.isExpanded,
    this.isMobProject = false,
    required this.readMoreClicked,
    required this.collapseClicked,
    required this.projectName,
    required this.projectDesc,
    required this.projectSSList, // Updated here
    required this.client,
    required this.role,
    required this.year,
    required this.aboutProject,
    required this.aboutClient,
    required this.challenges,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              responsiveLayout(
                mobile: SubHeading(label: projectName, isMob: true),
                other: SubHeading(label: projectName),
              ),
              SizedBox(height: 10),
              responsiveLayout(
                mobile: Text(
                  projectDesc,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                other: Text(
                  projectDesc,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 400.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppConstants.backGroundFrame,
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: ClipRect(
                  child: CustomPaint(
                    painter: CurvedLinePainter(),
                    child: Column(
                      children: [
                        Expanded(
                          child: responsiveLayout(
                            mobile: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: responsiveLayout(
                                  mobile: isMobProject
                                      ? SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              (projectSSList.length / 2)
                                                  .ceil(),
                                              (index) {
                                                int startIndex = index * 2;
                                                int endIndex =
                                                    (startIndex + 2).clamp(
                                                      0,
                                                      projectSSList.length,
                                                    );
                                          
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: projectSSList
                                                      .sublist(
                                                        startIndex,
                                                        endIndex,
                                                      )
                                                      .map(
                                                        (
                                                          imagePath,
                                                        ) => Expanded(
                                                          child: Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                    8.0,
                                                                  ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      8,
                                                                    ),
                                                                child:
                                                                    Image.asset(
                                                                      imagePath,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: projectSSList
                                              .map(
                                                (imagePath) => Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8.0,
                                                        ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                      child: Image.asset(
                                                        imagePath,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                  other: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: projectSSList
                                        .map(
                                          (imagePath) => Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                            other: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: responsiveLayout(
                                  mobile: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: projectSSList
                                        .map(
                                          (imagePath) => Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(imagePath),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  other: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: projectSSList
                                        .map(
                                          (imagePath) => Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                        ),
                        Visibility(
                          visible: isExpanded == false,
                          child: HoverBuilder(
                            builder: (context, isHovered) {
                              return InkWell(
                                onTap: () {
                                  readMoreClicked();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: isHovered
                                          ? AppConstants.primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Read More",
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                              color: isHovered
                                                  ? Colors.white
                                                  : Colors.grey[700],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_downward_rounded,
                                            size: 14,
                                            color: isHovered
                                                ? Colors.white
                                                : Colors.grey[700],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Visibility(
          visible: isExpanded,
          child: responsiveLayout(
            mobile: SizedBox(
              height: 300.h,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: AppConstants.primaryColor,
                        width: 3,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            clip("Client", client, true),
                            clip("Year", year, true),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [clip("My Role", role, true)],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          textAndDesc("About", aboutProject, isMob: true),
                          SizedBox(height: 20),
                          textAndDesc("Tech Stack", aboutClient, isMob: true),
                          SizedBox(height: 20),
                          textAndDesc("Challanges", challenges, isMob: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            other: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: AppConstants.primaryColor,
                      width: 3,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          clip("Client", client, false),
                          clip("Year", year, false),
                        ],
                      ),
                      Row(children: [clip("My Role", role, false)]),
                    ],
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textAndDesc("About", aboutProject),
                        SizedBox(height: 20),
                        textAndDesc("Tech Stack", aboutClient),
                        SizedBox(height: 20),
                        textAndDesc("Challanges", challenges),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Visibility(
          visible: isExpanded,
          child: HoverBuilder(
            builder: (context, isHovered) {
              return InkWell(
                onTap: () {
                  collapseClicked();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: isHovered
                          ? AppConstants.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Collapse",
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: isHovered
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward_rounded,
                            size: 14,
                            color: isHovered ? Colors.white : Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget textAndDesc(String title, String desc, {bool isMob = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 50.sp : 38.sp,
            fontWeight: FontWeight.w800,
            color: AppConstants.textColor,
          ),
        ),
        Text(
          desc,
          style: GoogleFonts.poppins(
            fontSize: isMob ? 30.sp : 16.sp,
            fontWeight: FontWeight.w400,
            color: AppConstants.secondoryColor,
          ),
        ),
      ],
    );
  }

  Widget clip(String name, String desc, bool isMob) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: isMob ? 8 : 11,
              fontWeight: FontWeight.w300,
              color: AppConstants.textColor,
            ),
          ),
          Text(
            desc,
            style: GoogleFonts.poppins(
              fontSize: isMob ? 10 : 14,
              fontWeight: FontWeight.w600,
              color: AppConstants.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
