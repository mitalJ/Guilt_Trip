import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold.dart';

class Attendees extends StatefulWidget {
  const Attendees({Key? key}) : super(key: key);

  @override
  State<Attendees> createState() => _AttendeesState();
}

class _AttendeesState extends State<Attendees> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        isMenu: false,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Attendees'),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 30.0, bottom: 00.0, right: 00.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 30.0, bottom: 00.0, right: 10.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, top: 3.0, bottom: 00.0, right: 10.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 30.0, bottom: 00.0, right: 25.0),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 3.0, bottom: 00.0, right: 25.0),
                        child: Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}
