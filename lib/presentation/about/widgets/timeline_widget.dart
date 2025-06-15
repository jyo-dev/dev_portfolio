import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineItem {
  final String year;
  final String title;
  final String description;

  TimelineItem({
    required this.year,
    required this.title,
    required this.description,
  });
}

class TimelineWidget extends StatelessWidget {
  final List<TimelineItem> timelineItems;

  const TimelineWidget({super.key, required this.timelineItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: timelineItems
          .asMap()
          .entries
          .map(
            (entry) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (entry.key != timelineItems.length - 1)
                      Container(
                        width: 2,
                        height: 60,
                        color: Colors.deepPurple.shade200,
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.value.year,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        entry.value.title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        entry.value.description,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
