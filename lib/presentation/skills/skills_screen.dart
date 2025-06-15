import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:dev_portfolio/presentation/skills/widgets/skill_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          responsiveLayout(
            mobile: SubHeading(label: "Skills", isMob: true),
            other: SubHeading(label: "Skills"),
          ),
          responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 70)),
          responsiveLayout(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkillWidgets(
                  skillName: "Languages",
                  skills: ["Dart", "Kotlin", "C", "C++"],
                ),
                SizedBox(height: 20),
                SkillWidgets(
                  skillName: "Databases",
                  skills: ["Hive", "Isar", "Floordb", "SecureStorage"],
                ),
                SizedBox(height: 20),
                SkillWidgets(
                  skillName: "State Management",
                  skills: ["Bloc", "Provider", "GetX", "Riverpod"],
                ),
                SizedBox(height: 20),
                SkillWidgets(
                  skillName: "Other",
                  skills: [
                    "Firebase",
                    "Platform Channels",
                    "CI/CD automation",
                    "Restful-Apis",
                  ],
                ),
              ],
            ),
            other: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkillWidgets(
                  skillName: "Languages",
                  skills: ["Dart", "Kotlin", "C", "C++"],
                ),
                SkillWidgets(
                  skillName: "Databases",
                  skills: ["Hive", "Isar", "Floordb", "SecureStorage"],
                ),
                SkillWidgets(
                  skillName: "State Management",
                  skills: ["Bloc", "Provider", "Riverpod"],
                ),
                SkillWidgets(
                  skillName: "Other",
                  skills: [
                    "Firebase",
                    "Platform Channels",
                    "CI/CD automation",
                    "Restful-Apis",
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
