import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:doctors/components/frontend/functions.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/components/frontend/textfields.dart';
import 'package:doctors/constants.dart';
import 'package:doctors/screens/home/components/appBarSlider.dart';
import 'package:doctors/screens/home/components/dailyReports.dart';
import 'package:doctors/screens/home/components/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  final Map<String, IconData> services = {
    "Covid-19": MdiIcons.virus,
    "Doctors": MdiIcons.doctor,
    "Hospitals": MdiIcons.hospital,
    "Medicines": MdiIcons.medication,
  };
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Screen s = Screen(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme,
            collapsedHeight: kToolbarHeight * 1.5,
            centerTitle: true,
            toolbarHeight: kToolbarHeight * 1.5,
            elevation: 10,
            expandedHeight: 290 * s.customWidth,
            floating: false,
            forceElevated: true,
            foregroundColor: theme,
            pinned: true,
            snap: false,
            stretch: true,
            scrolledUnderElevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: trans,
              statusBarIconBrightness: Brightness.light,
            ),
            title: title(s),
            flexibleSpace: flexibleSpace(context, s),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [ServicesSection(services), DailyReports()],
              ),
            ),
          )
        ],
      ),
    );
  }

  FlexibleSpaceBar flexibleSpace(BuildContext context, Screen s) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        margin: EdgeInsets.fromLTRB(
          15,
          kToolbarHeight * 1.5 + s.topPadding + 10,
          15,
          0,
        ),
        child: Column(
          children: [
            CustomTextField(
              searchController,
              hintText: "Search",
              prefixConstraints: const BoxConstraints(minWidth: 60),
              prefixIcon: Image.asset(
                "assets/images/search.png",
                width: 20,
                height: 20,
                color: theme,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: weekdays
                    .map(
                      (e) => HomePageAppBarSliderItem(
                        name: e,
                        date: padString((now.add(
                          Duration(
                            days: weekdays.indexOf(e),
                          ),
                        )).day),
                        isActive: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget title(Screen s) {
    return Padding(
      padding: EdgeInsets.only(top: s.topPadding, bottom: s.topPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/wavingHand.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "Hello,",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7.5),
              const Text(
                "Gregory House",
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: white, width: 0.5),
            ),
            child: Image.asset(
              "assets/images/profileImage.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
