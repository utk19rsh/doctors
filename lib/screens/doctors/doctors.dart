import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/components/frontend/textfields.dart';
import 'package:doctors/constants.dart';
import 'package:doctors/screens/doctors/components/tiles.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> with AutomaticKeepAliveClientMixin {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Screen s = Screen(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme,
            collapsedHeight: kToolbarHeight,
            centerTitle: true,
            toolbarHeight: kToolbarHeight,
            elevation: 10,
            expandedHeight: 180,
            floating: false,
            forceElevated: true,
            foregroundColor: theme,
            pinned: true,
            titleSpacing: 10,
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
                // padding: EdgeInsets.zero,
                children: [
                  nearbyDoctors(s),
                  recommendedDoctors(s),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container recommendedDoctors(Screen s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: s.width,
      color: white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "RECOMMENDED",
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
          ListView.builder(
            itemCount: 25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const DoctorsTileBody(),
                  const SizedBox(height: 15),
                  if (index != 24)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Divider(
                        color: grey.shade100,
                        endIndent: 0,
                        indent: 0,
                        thickness: 2,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Container nearbyDoctors(Screen s) {
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
                "DOCTORS NEARBY",
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
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: DoctorsTileBody(),
          ),
        ],
      ),
    );
  }

  FlexibleSpaceBar flexibleSpace(BuildContext context, Screen s) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        margin: EdgeInsets.fromLTRB(
          25,
          kToolbarHeight * 1.5 + s.topPadding,
          25,
          0,
        ),
        child: Column(
          children: [
            CustomTextField(
              controller,
              hintText: "Search",
              prefixConstraints: const BoxConstraints(minWidth: 60),
              prefixIcon: Image.asset(
                "assets/images/search.png",
                width: 20,
                height: 20,
                color: theme,
              ),
            ),
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
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  MdiIcons.chevronLeft,
                  color: white,
                  size: 30,
                ),
              ),
              const Text(
                "DOCTORS",
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MdiIcons.informationOutline,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
