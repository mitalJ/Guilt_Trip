import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guilt_app/constants/colors.dart';
import 'package:guilt_app/models/Auth/AllUserResponseModel.dart';
import 'package:guilt_app/models/Business/BusinessDetailResponseModel.dart';
import 'package:guilt_app/models/Business/search_business_master.dart';
import 'package:guilt_app/utils/Global_methods/GlobalStoreHandler.dart';
import 'package:guilt_app/utils/device/device_utils.dart';
import 'package:guilt_app/utils/routes/routes.dart';
import 'package:guilt_app/widgets/custom_scaffold.dart';
import 'package:guilt_app/widgets/rounded_button_widget.dart';

import '../../data/repository.dart';
import '../../di/components/service_locator.dart';
import '../../models/payment/payment_request.dart';
import '../../stores/user/user_store.dart';
import '../../utils/Global_methods/global.dart';
import '../../widgets/textfield_widget.dart';

class BusinessPayment extends StatefulWidget {
  const BusinessPayment({Key? key}) : super(key: key);

  @override
  State<BusinessPayment> createState() => _BusinessPaymentState();
}

// List of items in our dropdown menu

class _BusinessPaymentState extends State<BusinessPayment> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  var businessNameController = TextEditingController();
  final descriptionController = TextEditingController();
  String? type;
  SearchUserData? userData;
  Business? selectedBusiness;
  final UserStore _userStore = UserStore(getIt<Repository>());

  Future<List<Business>> searchBusinessByName(String searchQuery) async {
    dynamic master =
        await GlobalStoreHandler.postStore.getBusinessByNameList(searchQuery);
    debugPrint("$master");
    if (master != null) {
      SearchBusinessModel val = SearchBusinessModel.fromJson(master);
      debugPrint("Search business results returning${val.data!.length}");
      return val.data ?? [];
    }
    return [];
  }

  @override
  void didChangeDependencies() {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      type = args['type'];
      userData = args['userData'];
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Routes.goBack(context);
          },
          child: Icon(
            Icons.close, color: Colors.black,
            //color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Form(
          key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: DeviceUtils.getScaledWidth(context, 0.20),
            ),
            Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Container(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnngxCpo8jS7WE_uNWmlP4bME_IZkXWKYMzhM2Qi1JE_J-l_4SZQiGclMuNr4acfenazo&usqp=CAU',
                      width: DeviceUtils.getScaledWidth(context, 0.15),
                      height: DeviceUtils.getScaledWidth(context, 0.15),
                      fit: BoxFit.cover,
                    ),
                  ),
                ])),
            SizedBox(
              height: 15,
            ),
            Text(
              "${userData?.firstname ?? ""}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '+91 ${userData?.phone ?? ""}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: DeviceUtils.getScaledWidth(context, 0.65),
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: amountController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,0}')),
                ],
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                    hintText: "\$ 0",
                    fillColor: Colors.black12),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Amount";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your Business",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Autocomplete<Business>(
                    optionsBuilder: (TextEditingValue value) {
                      return searchBusinessByName(value.text);
                    },
                    displayStringForOption: (Business option) => option.name!,
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      businessNameController = fieldTextEditingController;
                      return TextFieldSearch(
                        controller: businessNameController,
                        hintText: "Select Your Business",
                        textInputType: TextInputType.text,
                        focusNode: fieldFocusNode,
                        validator: (val) {
                          if (val!.isEmpty || selectedBusiness == null) {
                            return "Select Your Business";
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                    onSelected: (Business business) {
                      selectedBusiness = business;
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<Business> onSelected,
                        Iterable<Business> businessList) {
                      return Container(
                        margin: EdgeInsets.only(top: 8, right: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  spreadRadius: 6)
                            ]),
                        padding: EdgeInsets.only(bottom: 12),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: businessList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Business business = businessList.elementAt(index);
                            return InkWell(
                                onTap: () {
                                  onSelected(business);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 6),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      top: 8,
                                    ),
                                    child: Text(
                                      business.name ?? "",
                                    ),
                                  ),
                                ));
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Container(
                              width: DeviceUtils.getScaledWidth(context, 0.60),
                              height:
                                  DeviceUtils.getScaledHeight(context, 0.06),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: new InputDecoration(
                                    // label: Text(
                                    //   "Location",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold, color: Colors.black),
                                    // ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    hintText: 'Enter Location'),
                              )),
                          Container(
                            width: DeviceUtils.getScaledWidth(context, 0.30),
                            height: DeviceUtils.getScaledHeight(context, 0.05),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
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
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                onPressed: () => {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    minLines: 4,
                    maxLines: 10,
                    keyboardType: TextInputType.text,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Enter your description',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Description";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.44),
                        child: ElevatedButtonWithBorderWidget(
                          buttonColor: Colors.white,
                          textColor: AppColors.primaryColor,
                          onPressed: () {},
                          buttonText: ('Cancel'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.44),
                        child: ElevatedButtonWidget(
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            if (type == "Pay") {
                            } else if (type == "Request") {
                              if (formkey.currentState!.validate()) {
                                requestUserForPayment(
                                    toUserId: userData?.id,
                                    businessId: selectedBusiness?.id,
                                    amount: int.parse(amountController.text),
                                    remarks: descriptionController.text);
                              } else {
                                print('Eroor');
                              }
                            }
                          },
                          buttonText: (type ?? ""),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  requestUserForPayment({toUserId, businessId, amount, remarks}) async {
    GlobalMethods.showLoader();
    _userStore.requestUserForPayment(toUserId, businessId, amount, remarks,
        (PaymentMaster paymentMaster) {
      GlobalMethods.hideLoader();
      if (paymentMaster != null) {
        if (paymentMaster.success != null && paymentMaster.success!) {
          GlobalMethods.showSuccessMessage(
              context, paymentMaster.message!, type ?? "");
        } else {
          GlobalMethods.showErrorMessage(
              context, paymentMaster.message!, type ?? "");
        }
      }
    }, (error) {
      GlobalMethods.hideLoader();
      print(error.toString());
    });
  }
}
