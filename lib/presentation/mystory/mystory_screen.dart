import 'package:dev_portfolio/core/dev_journey.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/core/widgets/subheading.dart';
import 'package:flutter/material.dart';

class MyStoryScreen extends StatelessWidget {
  const MyStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          responsiveLayout(
            mobile: SubHeading(label: "My Story", isMob: true),
            other: SubHeading(label: "My Story"),
          ),
          responsiveLayout(
            mobile: SizedBox(height: 20),
            other: SizedBox(height: 70),
          ),

          responsiveLayout(
            mobile: DeveloperJourney(isMob: true),
            other: DeveloperJourney(isMob: false),
          ),
        ],
      ),
    );
  }
}
