import 'package:flutter/material.dart';
import 'package:doctors/components/frontend/dots.dart';
import 'package:doctors/components/frontend/functions.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/constants.dart';

class DailyReports extends StatelessWidget {
  const DailyReports({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen s = Screen(context);
    List<int> indexes = List.filled(25, 0);
    return Container(
      width: s.width,
      color: white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DAILY REPORTS",
                  style: TextStyle(
                    color: navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Dots(color: navy),
                      Dots(color: navy, margin: EdgeInsets.zero),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: indexes
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.5),
                                child: Text(
                                  "Symptoms of Covid to watch out for",
                                  style: TextStyle(
                                    color: navy,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Text(
                                getDailyUpdateTileTime(),
                                style: const TextStyle(
                                  color: grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 3,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/image.png",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
