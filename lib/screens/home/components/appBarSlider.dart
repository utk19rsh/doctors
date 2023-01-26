import 'package:doctors/components/frontend/dots.dart';
import 'package:flutter/material.dart';
import 'package:doctors/constants.dart';

class HomePageAppBarSliderItem extends StatefulWidget {
  const HomePageAppBarSliderItem({
    Key? key,
    required this.name,
    required this.date,
    this.isActive = false,
  }) : super(key: key);

  final String name, date;
  final bool isActive;

  @override
  State<HomePageAppBarSliderItem> createState() =>
      _HomePageAppBarSliderItemState();
}

class _HomePageAppBarSliderItemState extends State<HomePageAppBarSliderItem> {
  bool isActive = false;
  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isActive = !isActive),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                color: white,
              ),
            ),
            Card(
              elevation: 1,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              color: isActive ? lightTheme : white,
              child: Container(
                padding: const EdgeInsets.all(7.5),
                alignment: Alignment.center,
                child: Text(
                  widget.date,
                  style: TextStyle(color: !isActive ? theme : white),
                ),
              ),
            ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.5),
                child: Row(
                  children: [
                    Dots(color: white),
                    Dots(color: white),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
