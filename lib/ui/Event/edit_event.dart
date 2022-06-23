import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guilt_app/constants/colors.dart';
import 'package:guilt_app/models/Event/create_event_modal.dart';
import 'package:guilt_app/utils/Global_methods/global.dart';
import 'package:guilt_app/utils/device/device_utils.dart';
import 'package:guilt_app/utils/routes/routes.dart';
import 'package:guilt_app/widgets/custom_body_wrapper.dart';
import 'package:guilt_app/widgets/rounded_button_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../constants/app_settings.dart';
import '../../data/repository.dart';
import '../../di/components/service_locator.dart';
import '../../models/Event/EventDetailResponseModel.dart';
import '../../models/Event/SearchEventResponseModel.dart';
import '../../stores/user/user_store.dart';
import '../../widgets/custom_scaffold.dart';

class Edit_event extends StatefulWidget {
  const Edit_event({Key? key}) : super(key: key);

  @override
  State<Edit_event> createState() => _Edit_eventState();
}

class _Edit_eventState extends State<Edit_event> {
  late List<Attendees> Selectedcontactlist = [];
  List<File> pickedImageList = [];
  Event? contentData;
  EventDetailsResponseModel? contentData1;
  String expenseAmount="";
  String expenseDescription="";
  final UserStore _userStore = UserStore(getIt<Repository>());
  var args;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventCategoryController = TextEditingController();
  TextEditingController _eventLocationController = TextEditingController();
  TextEditingController _eventStartDateAndTimeController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController _eventEndDateAndTimeController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController _eventPlaceDescriptionController =
      TextEditingController();
  List<dynamic> addressList = [];
  late LatLng addressLatLng;
  var addData;
  var userId;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      args = ModalRoute.of(context)!.settings.arguments;

      getDetails(args);
      await _userStore.getProfile();
      setState(() {
        addData = _userStore.Profile_data;
        userId =  addData?.user?.id == 0 ? "" : addData?.user?.id.toString();

      });
      AppSettings.EventID = args.toString();
      // setData(args);
    });
  }

  getDetails(args) {


    _userStore.Event_Detail(args, (value) {
      print(value);
      setState(() {
        contentData1 = EventDetailsResponseModel.fromJson(value);
        contentData = contentData1!.event;
        setData();
      });
      // validatePayButton();
    }, (error) {
      GlobalMethods.hideLoader();
      print(error.toString());
    });
  }

  Future<void> setData() async {

    _eventNameController.text = contentData!.name!;
    _eventCategoryController.text = contentData!.category!;
    _eventLocationController.text = contentData!.location!;
    _eventStartDateAndTimeController.text = contentData!.startDate!;
    _eventEndDateAndTimeController.text = contentData!.endDate!;
    _eventPlaceDescriptionController.text = contentData!.description!;
    expenseAmount = contentData!.totalExpense!.toString();
    expenseDescription = contentData!.expenseDescription!.toString();
    List<dynamic> locations = await locationFromAddress(contentData!.location!);

    setState(() {
      addressList = locations;
      print(addressList);
      addressLatLng = LatLng(addressList[0].latitude, addressList[0].longitude);
      setAttendee(contentData!.eventAttendees!);
    });
    // photos = business.businessPhotos!;
    getImages(contentData!.eventImages!);
  }

  //set attende from privios page for editing
  setAttendee(List<EventAttendees1> list) {
    setState(() {
      for (int i = 0; i < list.length; i++) {
        Selectedcontactlist.add(Attendees(
            phone:list[i].admin!.phone!, expanse: list[i].expense!));
      }
    });
  }

  getImages(List<EventImages> photos) async {
    for (int i = 0; i < photos.length; i++) {
      // generate random number.
      var rng = new Random();
// get temporary directory of device.
      Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
      String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
      File file =
          new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
      http.Response response = await http.get(Uri.parse(photos[i].file!));

// write bodyBytes received in response to file.
      await file.writeAsBytes(response.bodyBytes);

      print("File: $file");
      final tempImage = file;
      // pickedImageList.add(tempImage);
      //
      setState(() {
        pickedImageList.add(tempImage);
      });
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
      return file;
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select a Photo",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    child: Text("Choose from Library...",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImageList = [...pickedImageList, tempImage];
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  void didChangeDependencies() {
    try {
      final args =
          ModalRoute.of(context)?.settings.arguments as List<Attendees>;
      if (args != null) {
        print(args);
        setState(() {
          Selectedcontactlist = args;
        });
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
    }
    super.didChangeDependencies();
  }

  Widget getConditionsWidgets() {
    if (Selectedcontactlist.length > 0) {
      return Row(
        children: Selectedcontactlist.map(
            (item) => Selectedcontactlist.indexOf(item) < 5
                ? Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 40,
                    width: 40,
                    // margin: EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.icons8.com/color/344/person-male.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.orange,
                        shape: BoxShape.circle),
                  )
                : Selectedcontactlist.lastIndexOf(item) == 5
                    ? Container(
                        height: 40,
                        width: 40,
                        child: Padding(
                          padding: EdgeInsets.only(top: 11),
                          child: Text(
                            '+' +
                                (Selectedcontactlist.length -
                                        Selectedcontactlist.lastIndexOf(item))
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle),
                      )
                    : Container()).toList(),
      );
    } else {
      return IconButton(icon: Icon(Icons.add), onPressed: () {});
    }
  }

  deleteImage(img) {
    var indexOfImage = pickedImageList.indexOf(img);
    if (indexOfImage >= 0) {
      setState(() {
        pickedImageList.removeAt(indexOfImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        isMenu: false,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          //title: !_isSearchBar ? Text('Search Event') : _searchTextField(),
          title: Text('Edit Events'),
          centerTitle: true,
        ),
        child: CustomBodyWrapper(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 100),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Event Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          width: DeviceUtils.getScaledWidth(context, 0.85),
                          height: DeviceUtils.getScaledHeight(context, 0.08),
                          child: TextFormField(
                            autocorrect: true,
                            controller: _eventNameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Event Name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Enter Category",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                      width: DeviceUtils.getScaledWidth(context, 0.85),
                      height: DeviceUtils.getScaledHeight(context, 0.08),
                      child: TextFormField(
                        controller: _eventCategoryController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Category',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            maxLines: 3,
                            onChanged: (val) {},
                            controller: _eventLocationController,
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter Location'),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 13,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Set on Map',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (_eventLocationController.value.text.trim() !=
                                '') {
                              GlobalMethods.askLocationPermissionsOnly(context,
                                  () async {
                                Map<String, dynamic> result =
                                    await Navigator.of(context)
                                        .pushNamed(Routes.map, arguments: {
                                  'address': _eventLocationController.value.text
                                }) as Map<String, dynamic>;
                                setState(() {
                                  if (result != null) {
                                    addressLatLng =
                                        result['position'] as LatLng;
                                    _eventLocationController.text =
                                        result['address'];
                                  }
                                });
                              });
                            } else {
                              GlobalMethods.showErrorMessage(context,
                                  'Please Enter Address', 'Address Required');
                            }
                            //var result =  Routes.navigateToScreen(context, Routes.map);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 1, // Thickness
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Start Date & Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: DateTimePicker(
                                  controller: _eventStartDateAndTimeController,

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0)),
                                  type: DateTimePickerType.dateTime,
                                  dateMask: 'd MMM, yyyy HH:mm',
                                  //initialValue: DateTime.now().toString(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  icon: Icon(Icons.event),
                                  selectableDayPredicate: (date) {
                                    // Disable weekend days to select from the calendar
                                    /*if (date.weekday == 6 ||
                                        date.weekday == 7) {
                                      return false;
                                    }*/

                                    return true;
                                  },
                                  onChanged: (val) => print(val),
                                  validator: (val) {
                                    print(val);
                                    return null;
                                  },
                                  onSaved: (val) => print(val),
                                )),
                            Container(
                              height: 1, // Thickness
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "End Date & Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: DateTimePicker(
                              controller: _eventEndDateAndTimeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0)),
                              type: DateTimePickerType.dateTime,
                              dateMask: 'd MMM, yyyy HH:mm',
                              //initialValue: DateTime.now().toString(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                              icon: Icon(Icons.event),
                              selectableDayPredicate: (date) {
                                // Disable weekend days to select from the calendar
                                if (date.weekday == 6 || date.weekday == 7) {
                                  return false;
                                }

                                return true;
                              },
                              onChanged: (val) => print(val),
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => print(val),
                            )),
                            Container(
                              height: 1, // Thickness
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Describe your place",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.86),
                        child: TextFormField(
                          minLines: 2,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          controller: _eventPlaceDescriptionController,
                          decoration: InputDecoration(
                            hintText: 'Enter your description',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Upload Event Photo" + AppSettings.addUptoUploadSize,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                      alignment: WrapAlignment.start,
                      children: pickedImageList
                          .map(
                            (image) => Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 2),
                                  ),
                                  child: ClipRect(
                                    child: image != null
                                        ? Image.file(
                                            image!,
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://i.pinimg.com/474x/e7/0b/30/e70b309ec42e68dbc70972ec96f53839.jpg',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  left: 65,
                                  child: InkWell(
                                    onTap: () {
                                      deleteImage(image);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.primaryColor,
                                      radius: 12,
                                      child: Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          .toList()
                      //getImages()

                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 13,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Browse',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                          onPressed: imagePickerOption,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Invite Attended",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Selectedcontactlist.length > 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getConditionsWidgets(),
                                  ],
                                )
                              : Text(
                                  "Add Attendence with control list",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 13,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add Contact',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                          onPressed: () {
                            GlobalMethods.askPermissionsOnly(context, () async {
                            var result = await Navigator.of(context)
                                  .pushNamed(Routes.add_contacts);
                              setState(() {
                                if (result != null) {
                                  List<Attendees> data = result as List<Attendees>;
                                  for(int i = 0;i<data.length;i++)
                                  Selectedcontactlist.add(Attendees(phone:data[i].phone,expanse:0));
                                }
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: ElevatedButtonWidget(
                        buttonText: 'Continue',
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {
                          if (_eventNameController.value.text.trim() != '') {
                            if (_eventCategoryController.value.text.trim() !=
                                '') {
                              if (_eventLocationController.value.text.trim() !=
                                  '') {
                                if (_eventStartDateAndTimeController.value.text
                                        .trim() !=
                                    '') {
                                  if (_eventEndDateAndTimeController.value.text
                                          .trim() !=
                                      '') {
                                    if (_eventPlaceDescriptionController
                                            .value.text
                                            .trim() !=
                                        '') {
                                      if (pickedImageList.length > 0) {
                                        if (Selectedcontactlist.length > 0) {
                                          CreateEventRequestModal eData =
                                              CreateEventRequestModal(
                                            name:
                                                _eventNameController.value.text,
                                            category: _eventCategoryController
                                                .value.text,
                                            location: _eventLocationController
                                                .value.text,
                                            startDate:
                                                _eventStartDateAndTimeController
                                                    .value.text,
                                            endDate:
                                                _eventEndDateAndTimeController
                                                    .value.text,
                                            description:
                                                _eventPlaceDescriptionController
                                                    .value.text,
                                            files: pickedImageList,
                                            attendees: Selectedcontactlist,
                                            expenseDescription: expenseDescription,
                                            totalExpense: expenseAmount,
                                            long: addressLatLng?.longitude
                                                    .toString() ??
                                                '',
                                            lat: (addressLatLng?.longitude
                                                    .toString() ??
                                                ''),
                                          );
                                          Routes.navigateToScreenWithArgs(
                                              context,
                                              Routes.edit_expense,
                                              eData);
                                        } else {
                                          GlobalMethods.showErrorMessage(
                                              context,
                                              'Please select attendees',
                                              'Create Event');
                                        }
                                      } else {
                                        GlobalMethods.showErrorMessage(
                                            context,
                                            'Please upload an image',
                                            'Create Event');
                                      }
                                    } else {
                                      GlobalMethods.showErrorMessage(
                                          context,
                                          'Event Description Required',
                                          'Create Event');
                                    }
                                  } else {
                                    GlobalMethods.showErrorMessage(
                                        context,
                                        'Event End Date and Time Required',
                                        'Create Event');
                                  }
                                } else {
                                  GlobalMethods.showErrorMessage(
                                      context,
                                      'Event Start Date and Time Required',
                                      'Create Event');
                                }
                              } else {
                                GlobalMethods.showErrorMessage(context,
                                    'Event Location Required', 'Create Event');
                              }
                            } else {
                              GlobalMethods.showErrorMessage(context,
                                  'Event Category Required', 'Create Event');
                            }
                          } else {
                            GlobalMethods.showErrorMessage(
                                context, 'Event Name Required', 'Create Event');
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _eventStartDateAndTimeController.dispose();
    _eventEndDateAndTimeController.dispose();
    _eventPlaceDescriptionController.dispose();
    _eventCategoryController.dispose();
    _eventLocationController.dispose();
    _eventNameController.dispose();
    super.dispose();
  }
}
