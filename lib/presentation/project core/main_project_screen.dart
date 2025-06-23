import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_portfolio/core/app_constants.dart';
import 'package:dev_portfolio/core/hover_builder.dart';
import 'package:dev_portfolio/core/widgets/responsive_layout.dart';
import 'package:dev_portfolio/presentation/bloc/screen_cubit.dart';
import 'package:dev_portfolio/presentation/project%20core/widgets/client_logo.dart';
import 'package:dev_portfolio/presentation/project%20core/widgets/detailed_projects.dart';
import 'package:dev_portfolio/presentation/project%20core/widgets/open_source.dart';
import 'package:dev_portfolio/presentation/projects/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainProjectScreen extends StatefulWidget {
  final int projectIndex;
  final bool? isScrollPositionMentioned;
  const MainProjectScreen({
    super.key,
    required this.projectIndex,
    this.isScrollPositionMentioned,
  });

  @override
  State<MainProjectScreen> createState() => _MainProjectScreenState();
}

class _MainProjectScreenState extends State<MainProjectScreen> {
  bool isAutoPlay = true;
  bool isExpanded = false;
  int initialPage = 0;
  int currentIndex = 0;
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    updateValue();

    log("Project INDEX :${widget.projectIndex}");
  }

  updateValue() {
    if (widget.projectIndex != 0) {
      if (widget.isScrollPositionMentioned == true) {
        isAutoPlay = true;
        isExpanded = false;
        currentIndex = widget.projectIndex;
        initialPage = widget.projectIndex;
      } else {
        isAutoPlay = false;
        isExpanded = true;
        currentIndex = widget.projectIndex;
        initialPage = widget.projectIndex;
      }
    } else {
      isAutoPlay = true;
      isExpanded = false;
      currentIndex = 0;
    }
  }

  @override
  void didUpdateWidget(covariant MainProjectScreen oldWidget) {
    updateValue();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          responsiveLayout(
            mobile: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Crafted with Code",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7A3FFF),
                      height: 0.9,
                    ),
                  ),
                ],
              ),
            ),
            other: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Crafted with Code",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.poppins(
                      fontSize: 98.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7A3FFF),
                      height: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),

          responsiveLayout(
            mobile: Text(
              "A curated collection of meaningful digital experiences I've designed and developed — with care, code, and a focus on impact",
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
                color: AppConstants.textColor,
              ),
            ),
            other: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "A curated collection of meaningful digital experiences I've designed and developed — with care, code, and a focus on impact",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.textColor,
                ),
              ),
            ),
          ),
          responsiveLayout(mobile: SizedBox(), other: SizedBox(height: 70)),
          responsiveBuilder((context, isMob) {
            return CarouselSlider(
              items: [
                DetailedProjects(
                  client: "Metro Cash And Carry",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'Teller',
                  projectDesc:
                      'A Flutter Web-based teller system for Metro Cash and Carry to manage and record physical and non-cash transactions efficiently.',
                  projectSSList: ["assets/teller-1.png", "assets/teller-2.png"],
                  role: 'Software Engineer-Front End',
                  year: '2022',
                  aboutProject:
                      'A comprehensive teller interface developed for Metro Cash and Carry, designed to streamline the process of physical currency counting and reconciliation at store counters. The application supports both cash and non-cash entries, enabling users to record denominations, reconcile discrepancies, and generate real-time totals.',
                  aboutClient:
                      'Flutter Web, Provider (State Management), REST APIs',
                  challenges:
                      'This project was developed in early 2022, when Flutter Web was still maturing. Implementing a fluid keyboard-based workflow was particularly challenging due to limited support for shortcuts and focus management at the time. Despite these constraints, I successfully built a responsive and user-friendly interface that met the operational needs of the retail teller system.',
                ),
                DetailedProjects(
                  client: "Chaitanya Fintech",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'Training 360',
                  projectDesc:
                      'Built a full-fledged training management web app for Chaitanya Fintech using Flutter Web and BLoC',
                  projectSSList: ["assets/train-1.png", "assets/train-2.png"],
                  role: 'Software Engineer-Front End',
                  year: '2023',
                  aboutProject:
                      'An internal web application built for Chaitanya Fintech to manage employee training programs across departments. Designed to streamline scheduling, attendance, and performance tracking in one centralized interface.',
                  aboutClient:
                      'Flutter Web, BloC (State Management), REST APIs, goRouter',
                  challenges:
                      'Implementing role-based user logins and permissions was a key hurdle. Building a fully customizable calendar from scratch for training schedules, and managing dynamic UI elements for different user roles and training states made the frontend development especially challenging.',
                ),
                DetailedProjects(
                  client: "Besix",
                  isExpanded: isExpanded,
                  isMobProject: true,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'Besix Hub',
                  projectDesc:
                      'A cross-platform (iOS/Android) internal application for Besix Group, centralizing employee engagement, operational management, and communication with features like leave requests, reimbursements, news feeds, and canteen ordering.',
                  projectSSList: [
                    "assets/besix-1.png",
                    "assets/besix-2.png",
                    "assets/besix-3.png",
                    "assets/besix-4.png",
                    "assets/besix-5.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2024',
                  aboutProject:
                      'A centralized internal platform developed for the Besix Group, available on both iOS and Android, designed to enhance employee engagement and streamline operational workflows. The application consolidates various internal processes, fostering improved communication and efficiency across multiple sites.',
                  aboutClient:
                      'Flutter IOS & Android, Provider (State Management), REST APIs , AD Login',
                  challenges:
                      'Developing a feature-rich application while ensuring a lightweight footprint and smooth performance was a primary challenge. This involved optimizing asset loading, especially for large files like project brochures and videos, to prevent UI lag and provide a seamless user experience. Strategies for efficient data synchronization and robust file handling were crucial to meet the operational demands.',
                ),
                DetailedProjects(
                  client: "Besix",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  isMobProject: true,
                  projectName: 'Besix TimeKeeping',
                  projectDesc:
                      'A Flutter-based tablet and kiosk application for Besix Group, automating contract worker timekeeping, attendance, and daily work logging, replacing manual processes with a fast, intuitive digital solution.',
                  projectSSList: [
                    "assets/timekeeping-1.png",
                    "assets/timekeeping-2.png",
                    "assets/timekeeping-3.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2024',
                  aboutProject:
                      'An intuitive tablet and kiosk-based application developed for the Besix Group, designed to digitize and automate the tracking of contract workers\' daily work hours, attendance, and specific tasks performed. This system streamlines data collection, integrating seamlessly with their existing backend infrastructure and replacing previous manual, paper-based processes.',
                  aboutClient:
                      'Flutter IOS & Android, BloC (State Management), REST APIs , AD Login',
                  challenges:
                      'The primary challenge was to design and implement a fast-paced and highly intuitive user interface suitable for a construction environment, where quick data input and worker detail capture are essential. Optimizing the workflow to minimize interaction time was critical, transforming a traditionally manual pen-and-paper process into a fully digitized, efficient system that accommodates on-site conditions.',
                ),
                DetailedProjects(
                  client: "Bajaj",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  isMobProject: true,
                  projectName: 'KTM D&T',
                  projectSSList: [
                    "assets/ktm-1.png",
                    "assets/ktm-2.png",
                    "assets/ktm-3.png",
                    "assets/ktm-4.png",
                    "assets/ktm-5.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2024',
                  aboutProject:
                      'A cross-platform (Android & iOS) mobile application developed for KTM two-wheeler dealers and distributors. This diagnostic and troubleshooting tool provides guided, step-by-step workflows, leveraging multimedia content like videos, images, and documents to facilitate efficient issue resolution at service centers, significantly reducing support time.',
                  aboutClient: 'Flutter, Floordb , BloC , AD login',
                  challenges:
                      'A key challenge involved efficiently managing and processing large data downloads (including extensive multimedia content) in the background, coupled with robust local storage solutions for fast and reliable offline retrieval. Ensuring a seamless user experience while handling substantial content was crucial for providing effective, interactive troubleshooting workflows.',
                  projectDesc:
                      'A Flutter-based mobile app for KTM dealers, offering guided diagnostic and troubleshooting workflows with multimedia support, designed to reduce service center support time through efficient content delivery and local storage.',
                ),
                DetailedProjects(
                  client: "Bajaj",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'MCDNT',
                  isMobProject: true,
                  projectSSList: [
                    "assets/mcdnt-1.png",
                    "assets/mcdnt-2.png",
                    "assets/mcdnt-3.png",
                    "assets/mcdnt-4.png",
                    "assets/mcdnt-5.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2022 & 2025',
                  aboutProject:
                      'An Android native application developed in Kotlin, serving as a comprehensive diagnostic and troubleshooting tool for motorcycle mechanics and workshop employees. Similar to the KTM DNT, this application provides extensive reference materials, service libraries, and diagnostic flows. It also incorporates a new product feedback system for workshop employees.',
                  aboutClient:
                      'Kotlin, Android Native, MSAL (Microsoft Authentication Library), WorkManager, Room',
                  challenges:
                      'Reworking and enhancing an existing, complex native Android system, particularly with limited prior advanced Kotlin development experience, presented a significant challenge. A crucial aspect was handling multiple large background data downloads and processing (such as extensive motorcycle data structured by individual codes) without impacting UI responsiveness, ensuring a smooth and uninterrupted user experience.',
                  projectDesc:
                      'A native Kotlin Android app for motorcycle diagnostics and troubleshooting, featuring comprehensive reference materials, product feedback, and efficient background data processing, built upon and enhancing an existing system.',
                ),
                DetailedProjects(
                  client: "Metro Cash & Carry",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'MVC',
                  isMobProject: true,
                  projectSSList: [
                    "assets/mvc-1.png",
                    "assets/mvc-2.png",
                    "assets/mvc-3.png",
                    "assets/mvc-4.png",
                    "assets/mvc-5.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2022',
                  aboutProject:
                      'A dedicated Flutter application developed for Metro Cash & Carry, designed to streamline the verification process for their retail customers. The app enables comprehensive KYC updates, including document collection, detail entry, live GST data fetching, and seamless background synchronization with the central system, ensuring compliance and efficient customer onboarding.',
                  aboutClient:
                      'Flutter, Provider (State Management), Hive (Local Database), WorkManager (Background Processing), REST APIs',
                  challenges:
                      'This project marked a significant milestone as it was my first endeavor managing an entire application independently. A primary challenge involved establishing a robust and scalable architecture, encompassing effective state management and adhering to clean architecture principles, to ensure maintainability and performance while integrating complex features like live data fetching and background syncing.',
                  projectDesc:
                      'A Flutter-based customer verification app for Metro Cash & Carry, enabling comprehensive KYC updates, live GST data fetching, and background synchronization to streamline retail customer onboarding.',
                ),
                DetailedProjects(
                  client: "Chaitanya Fintech",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'Chaitanya Audit',
                  isMobProject: true,
                  projectSSList: [
                    "assets/ct-1.png",
                    "assets/ct-2.png",
                    "assets/ct-3.png",
                    "assets/ct-4.png",
                    "assets/ct-5.png",
                  ],
                  role: 'Software Engineer-Front End',
                  year: '2025',
                  aboutProject:
                      'A Flutter-based audit application developed for Chaithanya FinTech, empowering field personnel to conduct comprehensive verifications and audits. The application is designed to handle large datasets and supports collaborative auditing, allowing multiple team members (from audit leaders to individual members) to capture data for the same audit, with seamless synchronization controlled by the lead.',
                  aboutClient:
                      'Flutter, (Potentially mention specific state management, database, or network libraries, e.g., Provider/BLoC, Hive/isar, Dio), Flavoring/Environment Configuration',
                  challenges:
                      'Integrating multiple users working concurrently on the same audit, with real-time data synchronization managed by an audit leader, presented a significant architectural and data consistency challenge. Furthermore, cloning the same codebase for a partnered company while managing six distinct flavors (configurations/branding) required careful planning and execution to maintain code reusability and efficient deployment.',
                  projectDesc:
                      'A Flutter application for Chaithanya FinTech, facilitating collaborative field audits with robust data handling and multi-user synchronization. The app was also successfully cloned for a partner, managing six distinct flavors from a single codebase.',
                ),
                DetailedProjects(
                  client: "Sysfore",
                  isExpanded: isExpanded,
                  collapseClicked: () {
                    omCollapsed();
                  },
                  readMoreClicked: () {
                    setState(() {
                      isAutoPlay = false;
                      isExpanded = true;
                    });
                  },
                  projectName: 'Sysfore Test',
                  projectSSList: ["assets/test-1.png", "assets/test-2.png"],
                  role: 'Software Engineer-Front End',
                  year: '2025',
                  aboutProject:
                      'An in-house Flutter web application developed for Sysfore, designed to fully automate and manage the candidate onboarding process. This comprehensive platform covers everything from scheduling technical tests and enabling candidates to take exams, to automatically analyzing scores and implementing robust anti-cheat mechanisms.',
                  aboutClient: 'Flutter Web, BLoC, REST APIs',
                  challenges:
                      'A significant challenge involved implementing face detection capabilities within the Flutter Web environment. At the time of development, Flutter Web offered very limited native support and customization options for advanced features like real-time face detection, requiring creative workarounds and extensive effort to integrate this crucial anti-cheat component successfully.',
                  projectDesc:
                      'An in-house Flutter web application for Sysfore, automating the entire candidate onboarding and testing process, including test scheduling, automated scoring, and anti-cheat measures with challenging face detection implementation.',
                ),
              ],
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: isExpanded
                    ? isMob
                          ? 700
                          : 900
                    : 440,
                autoPlay: isAutoPlay,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                },
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 1.0,
                initialPage: initialPage,
              ),
            );
          }),

          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverBuilder(
                  builder: (context, isHovered) {
                    return InkWell(
                      onTap: () {
                        buttonCarouselController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppConstants.primaryColor,
                        radius: 18,
                        child: CircleAvatar(
                          backgroundColor: isHovered
                              ? AppConstants.primaryColor
                              : AppConstants.background,
                          radius: 16,
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 14,
                              color: isHovered
                                  ? AppConstants.background
                                  : AppConstants.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 20),
                HoverBuilder(
                  builder: (context, isHovered) {
                    return InkWell(
                      onTap: () {
                        buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppConstants.primaryColor,
                        radius: 18,
                        child: CircleAvatar(
                          backgroundColor: isHovered
                              ? AppConstants.primaryColor
                              : AppConstants.background,
                          radius: 16,
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 14,
                              color: isHovered
                                  ? AppConstants.background
                                  : AppConstants.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          OpenSourceWidget(),
          SizedBox(height: 30),
          ClientLogosSection(),
        ],
      ),
    );
  }

  void omCollapsed() {
    context.read<ScreenCubit>().updateScreen(
      1,
      projectIndex: currentIndex,
      isScrollPositionMentioned: true,
    );
  }
}
