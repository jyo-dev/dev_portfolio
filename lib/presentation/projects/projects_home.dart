import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/presentation/projects/widgets/project_card.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:flutter/material.dart';

class ProjectsHome extends StatelessWidget {
  const ProjectsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          responsiveLayout(
            mobile: SubHeading(label: "Key Projects", isMob: true),
            other: SubHeading(label: "Key Projects"),
          ),
          responsiveLayout(
            mobile: SizedBox(height: 20),
            other: SizedBox(height: 70),
          ),

          responsiveLayout(
            mobile: Column(
              children: [
                ProjectCard(
                  isMob: true,
                  projectSSList: ["assets/ktm-1.png"],
                  projectIndex: 4,
                  projectName: "KTM D&T",
                  smallDesc:
                      "Developed a diagnostic and troubleshooting app for KTM two-wheeler dealers and distributors.",
                ),
                SizedBox(height: 20),
                ProjectCard(
                  isMob: true,
                  projectSSList: ["assets/train-1.png", "assets/train-2.png"],
                  projectIndex: 1,
                  projectName: "Chaitanya Training 360",
                  smallDesc:
                      "Developed a comprehensive training management system with role-based access for different sectors.",
                ),
                SizedBox(height: 20),
                ProjectCard(
                  isMob: true,
                  projectSSList: [
                    "assets/test-1.png",
                    'assets/test-2.png',
                    //'assets/test-3.png',
                  ],
                  projectIndex: 8,
                  projectName: 'Sysfore Test',
                  smallDesc:
                      "An in-house Flutter web application developed for Sysfore, designed to fully automate and manage the candidate onboarding process.",
                ),
                SizedBox(height: 20),
                ProjectCard(
                  isMob: true,
                  projectSSList: ["assets/besix-2.png"],
                  projectIndex: 2,
                  projectName: "Besix Hub",
                  smallDesc:
                      "Created a centralized internal platform for employee engagement and operations",
                ),
              ],
            ),
            other: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ProjectCard(
                        projectSSList: ["assets/ktm-1.png", "assets/ktm-2.png"],
                        projectIndex: 4,
                        projectName: "KTM D&T",
                        smallDesc:
                            "Developed a diagnostic and troubleshooting app for KTM two-wheeler dealers and distributors.",
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 3,
                      child: ProjectCard(
                        projectSSList: ["assets/train-1.png"],
                        projectIndex: 1,
                        projectName: "Chaitanya Training 360",
                        smallDesc:
                            "Developed a comprehensive training management system with role-based access for different sectors.",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ProjectCard(
                        projectSSList: ["assets/test-1.png"],
                        projectIndex: 8,
                        projectName: 'Sysfore Test',
                        smallDesc:
                            "An in-house Flutter web application developed for Sysfore, designed to fully automate and manage the candidate onboarding process.",
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: ProjectCard(
                        projectSSList: [
                          "assets/besix-2.png",
                          "assets/besix-3.png",
                        ],
                        projectIndex: 2,
                        projectName: "Besix Hub",
                        smallDesc:
                            "Created a centralized internal platform for employee engagement and operations",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
