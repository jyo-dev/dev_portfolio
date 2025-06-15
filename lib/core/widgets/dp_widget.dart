import 'package:dev_portfolio/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DpWidget extends StatelessWidget {
  const DpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppConstants.background,
      radius: 300.r,
      child: CircleAvatar(
        backgroundColor: AppConstants.primaryColor,
        radius: 290.r,
        child: CircleAvatar(
          backgroundColor: AppConstants.background,
          radius: 289.5.r,
          child: CircleAvatar(
            radius: 250.r,
            backgroundImage: AssetImage('assets/dp.jpg'),
          ),
        ),
      ),
    );
  }
}
