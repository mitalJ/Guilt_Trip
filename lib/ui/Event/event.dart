import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guilt_app/constants/colors.dart';
import 'package:guilt_app/constants/dimens.dart';
import 'package:guilt_app/ui/Event/event_detail.dart';
import 'package:guilt_app/utils/device/device_utils.dart';
import 'package:guilt_app/widgets/custom_scaffold.dart';

import '../../utils/routes/routes.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        child: CupertinoSlidingSegmentedControl(
          padding:  EdgeInsets.all(5),
            groupValue: segmentedControlValue,
            children: <int, Widget>{
              0: _segmentTextBox('Upcoming'),
              1: _segmentTextBox('Past Events')
            },
            onValueChanged: (value) {
              setState(() {
                segmentedControlValue = value as int;
              });
            }),
      ),
    );
  }

  Widget _segmentTextBox(String title){
    return Padding(
      padding : EdgeInsets.all(8),
      child: Text(
          title,
          style: TextStyle(fontSize: 18, color: AppColors.primaryColor)),
    );
  }

  Widget box(String title, Color backgroundcolor, Image demo) {
    return Column(
      children: [
             Card(
              shadowColor: AppColors.grayTextColor,
              elevation: 2.5,
              child: Container(
                margin: EdgeInsets.all(5),
                width: DeviceUtils.getScaledWidth(context, 0.90),
                color: backgroundcolor,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://i.pinimg.com/474x/e7/0b/30/e70b309ec42e68dbc70972ec96f53839.jpg',
                        width: DeviceUtils.getScaledWidth(context, 0.20),
                        height: DeviceUtils.getScaledWidth(context, 0.20),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.horizontal_padding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('13 JAN 2022, 2:00PM - Upcoming',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            Text('A Virtual Evening of \nSmooth Jazz ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: AppColors.grayTextColor,
                                ),
                                Text(
                                  '36, guild street, london, uk',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grayTextColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ),

      ],
    );

  }

  Widget pastbox(String title, Color backgroundcolor, Image demo) {
    return Column(
      children: [
             Card(
              shadowColor: AppColors.grayTextColor,
              elevation: 2.5,
              child: Container(
                margin: EdgeInsets.all(5),
                width: DeviceUtils.getScaledWidth(context, 0.90),
                color: backgroundcolor,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://i.pinimg.com/474x/e7/0b/30/e70b309ec42e68dbc70972ec96f53839.jpg',
                        width: DeviceUtils.getScaledWidth(context, 0.20),
                        height: DeviceUtils.getScaledWidth(context, 0.20),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.horizontal_padding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('13 JAN 2022, 2:00PM - Past Event',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                            Text('A Virtual Evening of \nSmooth Jazz ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: AppColors.grayTextColor,
                                ),
                                Text(
                                  '36, guild street, london, uk',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grayTextColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

        Divider(
          color: Colors.black12,
          //color of divider
          height: 20,
          //height spacing of divider
          thickness: 1,
          //thickness of divier line
          indent: 20,
          //spacing at the start of divider
          endIndent: 20, //spacing at the end of divider
        ),
      ],
    );
  }

  List<String> item = [' b', 'c ', ' d', ' d', 'd ', 'c', 'f', 's'];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text('Upcoming Events'),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.horizontal_padding,
            vertical: Dimens.vertical_padding + 8),
        child: Column(
          children: [
            Center(
              child: segmentedControl(),
            ),
            Container(
              height: DeviceUtils.getScaledHeight(context, 0.75),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: item.map((iteml) {
                  return segmentedControlValue == 0
                      ? box(
                          iteml,
                          Colors.white,
                          Image.network(
                              'https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0'))
                      : pastbox(
                          iteml,
                          Colors.white,
                          Image.network(
                              'https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0'));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
