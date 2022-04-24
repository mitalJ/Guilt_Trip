import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:guilt_app/constants/strings.dart';
import 'package:guilt_app/ui/forgot_reset_password/change_password.dart';
import 'package:guilt_app/ui/forgot_reset_password/reset_password.dart';
import 'package:guilt_app/ui/login/login.dart';
import 'package:guilt_app/ui/signUp/signUp.dart';

import '../../constants/app_settings.dart';
import '../../constants/colors.dart';
import '../../data/repository.dart';
import '../../di/components/service_locator.dart';
import '../../stores/user/user_store.dart';
import '../Event/create_event.dart';
import '../Messages/message.dart';
import '../Profile/profile.dart';
import '../payment/wallet.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final UserStore _userStore = UserStore(getIt<Repository>());
  var currentIndex = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  List<Widget> items = [];
  final screens = [
    Profile(),
    Login(),
    SignUp(),
    Reset_password(),
    Change_password(),
  ];

  @override
  initState() {
    super.initState();
    items = [
      iconWithText(Icons.explore, Strings.explore),
      iconWithText(Icons.account_balance_wallet, Strings.wallet),
      iconWithText(
          Icons.calendar_month,
          _userStore.getUserRole() == AppSettings.businessUserRole
              ? Strings.addEvent
              : Strings.booking),
      iconWithText(Icons.question_answer_rounded, Strings.chat),
      iconWithText(Icons.account_circle_rounded, Strings.profile),
    ];
  }

  Widget iconWithText(icon, text, {double fontSize = 10}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          )
        ],
      );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      //appBar: widget.appBar,
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColors.primaryColor,
          color: AppColors.primaryColor,
          index: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: items),
      body: screens[currentIndex],
    );
  }
}