import 'dart:math';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:doctors/components/frontend/buttons.dart';
import 'package:doctors/constants.dart';

class DoctorsTileBody extends StatelessWidget {
  const DoctorsTileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DoctorsTileInnerBody(),
        const SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "Total Fee",
                    style: TextStyle(
                      color: grey.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "\$80",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 8,
              child: MyButton(
                onTap: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}

class DoctorsTileInnerBody extends StatelessWidget {
  const DoctorsTileInnerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: red,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/profileImage.png",
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gregory House",
                style: TextStyle(
                  color: navy,
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7.5),
              Text(
                "Nephrologist",
                style: TextStyle(
                  color: grey.shade400,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 7.5),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: blue.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      MdiIcons.briefcaseVariant,
                      color: blue,
                      size: 14,
                    ),
                  ),
                  Text(
                    "${Random().nextInt(8) + 1} years",
                    style: TextStyle(
                      color: grey.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: red.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      MdiIcons.heart,
                      color: red,
                      size: 14,
                    ),
                  ),
                  Text(
                    "${Random().nextInt(50) + 50} %",
                    style: TextStyle(
                      color: grey.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
