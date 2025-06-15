import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeveloperJourney extends StatelessWidget {
  final bool isMob;
  const DeveloperJourney({super.key, required this.isMob});

  @override
  Widget build(BuildContext context) {
    TextStyle normal = GoogleFonts.poppins(
      fontSize: isMob ? 12 : 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey[700],
    );

    TextStyle highlighted = normal.copyWith(
      color: Color(0xFF7A3FFF), // Purple color used in screenshot
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "My journey as a developer began with curiosity and a love for building. It all started with ",
              ),
              TextSpan(text: "Kotlin", style: highlighted),
              TextSpan(
                text:
                    " crafting Android apps as an intern at BlueMasons — my first real taste of turning ideas into usable products.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text("Eager to learn and grow, I joined ", style: normal),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "Riafy Technologies", style: highlighted),
              TextSpan(text: ". There, I dove headfirst into Flutter."),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text: "At Sysfore, I took the leap into leading full-scale ",
              ),
              TextSpan(text: "enterprise projects ", style: highlighted),
              TextSpan(
                text:
                    "— from training platforms to audit systems — all while focusing on clean architecture, performance, and real-world value.",
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "Today, I code to create meaningful experiences — and I love every bit of it. ",
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    "💜",
                    style: TextStyle(fontSize: isMob ? 12 : 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DeveloperJourneyInAbout extends StatelessWidget {
  const DeveloperJourneyInAbout({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle normal = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey[700],
    );

    TextStyle highlighted = normal.copyWith(
      color: Color(0xFF7A3FFF), // Your brand purple
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "Born in "),
              TextSpan(text: "1996", style: highlighted),
              TextSpan(text: " in the coastal town of "),
              TextSpan(text: "Thalassery 🏡", style: highlighted),
              TextSpan(
                text:
                    ", known for its circus, cricket, and cake — I grew up in a middle-class home with quiet dreams and a curious mind.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "Losing my father during my school days shaped my journey in ways I didn’t fully understand then. Over the years, I’ve realized I’ve spent more time without him than with him — and yet, I’ve found my way. Maybe not perfect, but certainly mine 🛤️.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "At 13, I got my first computer 💻. Games came first, but soon the machine itself became more interesting than what ran on it. That’s where the seed was planted.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "College life at "),
              TextSpan(text: "St. Aloysius, Mangaluru 🎓", style: highlighted),
              TextSpan(
                text:
                    " taught me logic, structure, and gave me my first taste of app development. Then came ",
              ),
              TextSpan(text: "VIT University 🚀", style: highlighted),
              TextSpan(
                text:
                    ", where the exposure and freedom opened up my world — both personally and technically.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "I interned at "),
              TextSpan(text: "BlueMasons", style: highlighted),
              TextSpan(
                text:
                    " where I worked with Kotlin and mobile apps. That’s when the abstract love for computers became something real I could build with.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "At "),
              TextSpan(text: "Riafy Technologies", style: highlighted),
              TextSpan(
                text:
                    " I discovered Flutter — and I haven’t looked back since. Cross-platform magic had me hooked 🧑‍💻.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(text: "At "),
              TextSpan(text: "Sysfore", style: highlighted),
              TextSpan(
                text:
                    ", I led full-scale enterprise projects — from training systems to audits. It taught me architecture, performance tuning, and ownership.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "Today, I code to craft real, thoughtful experiences — with curiosity as my compass 💜.",
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        // Beyond Resume Section
        Text("Beyond Code 🧠", style: highlighted.copyWith(fontSize: 18)),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "I’m not the loudest in the room — more the listener, the observer. I love ",
              ),
              TextSpan(text: "cricket 🏏", style: highlighted),
              TextSpan(text: " — especially "),
              TextSpan(text: "Australia", style: highlighted),
              TextSpan(text: ", even when it’s unpopular 😉. "),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Long-form conversations, podcasts 🎙️, and YouTube interviews? Count me in. I’m one of those who watches the entire 3-hour chat that most people skip.",
          style: normal,
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: normal,
            children: [
              TextSpan(
                text:
                    "Also a fan of politics 🗳️, current affairs, and when it comes to movies... ",
              ),
              TextSpan(text: "A24 > Marvel or DC 🎬", style: highlighted),
              TextSpan(text: ". Always."),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Thanks for stopping by — this is more than code for me. It’s life, story, curiosity, and expression 🌱.",
          style: normal,
        ),
      ],
    );
  }
}
