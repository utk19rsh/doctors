import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:doctors/components/frontend/buttons.dart';
import 'package:doctors/components/frontend/dots.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/constants.dart';
import 'package:doctors/screens/doctors/components/tiles.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController controller = TextEditingController();
  bool paypalSelected = true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Screen s = Screen(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.25,
        title: title(s),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: white,
                  padding: const EdgeInsets.all(20),
                  child: const DoctorsTileInnerBody(),
                ),
                costInfo(),
                paymentOptions(s),
                // Expanded(child: Container()),
              ],
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.all(20),
            child:  MyButton(
              aspectRatio: 7,
              onTap: () {},
              text: "Pay & Confirm",
            ),
          )
        ],
      ),
    );
  }

  Container paymentOptions(Screen s) {
    return Container(
      color: white,
      width: s.width,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PAYMENT OPTIONS",
            style: TextStyle(
              color: navy,
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => paypalSelected = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: grey.shade400,
                        width: 1,
                      ),
                    )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyCheckBox(paypalSelected),
                        Text("PayPal", style: textStyle())
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => paypalSelected = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyCheckBox(!paypalSelected),
                        Text(
                          "Credit Card",
                          style: textStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container costInfo() {
    return Container(
      color: white,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          paymentInfo("Total Cost", "\$80"),
          const SizedBox(height: 10),
          Text(
            "Session fee for 30 minutes",
            style: TextStyle(
              color: grey.shade400,
              fontSize: 14,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),
          paymentInfo("To Pay", "\$80"),
          const SizedBox(height: 15),
          const Divider(thickness: 0.4),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: theme.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/discount.png",
                  width: 20,
                  height: 20,
                  color: theme,
                ),
                Text(
                  "Use Promo Code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: navy,
                  ),
                ),
                const Icon(MdiIcons.chevronRight)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row paymentInfo(String reason, String cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          reason,
          style: textStyle(),
        ),
        Text(
          cost,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: navy,
          ),
        ),
      ],
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 1,
      color: navy,
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
                "APPOINTMENTS",
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
