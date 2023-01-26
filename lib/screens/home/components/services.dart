import 'package:flutter/material.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/constants.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection(
    this.services, {
    Key? key,
  }) : super(key: key);

  final Map<String, IconData> services;

  @override
  Widget build(BuildContext context) {
    Screen s = Screen(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: s.width,
      color: white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SERVICES",
                style: TextStyle(
                  color: theme,
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: amber,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: services.entries
                .map(
                  (e) => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              theme.withOpacity(0.2),
                              white,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: theme.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(e.value),
                        ),
                      ),
                      Text(
                        e.key,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
