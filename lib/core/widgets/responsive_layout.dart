import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget responsiveWrapper({required Widget child}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 900) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              child,
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 1.sw,
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Please use a desktop or laptop for a better experience.",
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return child; // Display the original widget if the screen is large enough
      }
    },
  );
}

Widget responsiveLayout({required Widget mobile, required Widget other}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 900) {
        return mobile;
      } else {
        return other; // Display the original widget if the screen is large enough
      }
    },
  );
}
