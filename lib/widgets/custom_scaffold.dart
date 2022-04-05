import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guilt_app/constants/colors.dart';
import 'package:guilt_app/constants/dimens.dart';
import 'package:guilt_app/ui/common/menu_drawer.dart';
import 'package:guilt_app/utils/routes/routes.dart';

class ScaffoldWrapper extends StatefulWidget {
  ScaffoldWrapper(
      {Key? key,
      required this.child,
      required this.appBar,
      this.isTab = false,
      this.isMenu = false})
      : super(key: key);

  final Widget child;
  final AppBar appBar;
  bool isMenu = false;
  bool isTab = false;

  @override
  State<ScaffoldWrapper> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> {
  Widget IconWithText(icon, text, {double fontSize = 12}) {
    return Column(
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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.isMenu == true ? MenuDrawer() : null,
      backgroundColor: Colors.white,
      appBar: widget.appBar,
      floatingActionButton: widget.isTab == true
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              //Floating action button on Scaffold
              onPressed: () {
                //code to execute on button press
              },
              child: IconWithText(
                  Icons.calendar_month, 'Add Event', fontSize: 8), //icon inside button
            )
          : null,
      floatingActionButtonLocation: widget.isTab == true
          ? FloatingActionButtonLocation.centerDocked
          : null,
      bottomNavigationBar: widget.isTab == true
          ? BottomAppBar(
              color: AppColors.primaryColor,
              //bottom navigation bar on scaffold
              shape: CircularNotchedRectangle(),
              //shape of notch
              notchMargin: 4,
              //notch margin between floating button and bottom appbar
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //children inside bottom appbar
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Routes.navigateToScreen(context, Routes.events_home);
                      },
                      child: IconWithText(Icons.explore, 'Explore'),
                    ),
                    InkWell(
                      onTap: () {
                        Routes.navigateToScreen(context, Routes.events_home);
                      },
                      child: IconWithText(Icons.account_balance_wallet, 'Wallet'),
                    ),
                    InkWell(
                      onTap: () {
                        Routes.navigateToScreen(context, Routes.message);
                      },
                      child: IconWithText(Icons.question_answer_rounded, 'Chat'),
                    ),
                    InkWell(
                      onTap: () {
                        Routes.navigateToScreen(context, Routes.view_profile);
                      },
                      child: IconWithText(Icons.account_circle_rounded, 'Profile'),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Container(
        color: AppColors.primaryColor,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          child: Container(
            color: Colors.white,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
