import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_adventure_ui/core/themes.dart';

class CenterStar extends StatelessWidget {
  const CenterStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -6,
            offset: Offset(3, 7),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: SAColors.black.withOpacity(.95),
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(20),
        child: Opacity(
          opacity: .95,
          child: Transform.rotate(
            angle: pi / 4,
            child: Image.asset(
              'lib/presentation/images/four_point_star.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
