import 'package:dev_portfolio/core/widgets/dp_widget.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';

import 'package:dev_portfolio/presentation/home/widgets/intro_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return responsiveLayout(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: DpWidget()),
          IntroText(),
          SizedBox(width: 200),
        ],
      ),
      other: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: IntroText()),
          SizedBox(width: 200),
          DpWidget(),
        ],
      ),
    );
  }
}
