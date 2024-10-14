import 'package:airport_gate/core/colors.dart';
import 'package:airport_gate/widgets/marquee.dart';
import 'package:flutter/material.dart';

class MarqueeBuilder extends StatelessWidget {
  final String marqueeText;

  const MarqueeBuilder(
      {super.key, required this.marqueeText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 30,
            child: Marquee(
              text: marqueeText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: nightBlueColor,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 200.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
  }
}
