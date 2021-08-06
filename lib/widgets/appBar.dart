import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontSize.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/constants/space.dart';
import 'package:liveasy_admin/controller/ShipperController.dart';
import 'package:liveasy_admin/controller/TransporterController.dart';
import 'package:liveasy_admin/controller/searchButtonController.dart';
import 'package:liveasy_admin/models/shipperApiModel.dart';
import 'package:liveasy_admin/screens/updateShipperScreen.dart';
import 'package:liveasy_admin/screens/updateTransporterScreen.dart';
import 'package:liveasy_admin/services/getshipper_transporterApi.dart';
import 'package:liveasy_admin/widgets/signOutButton.dart';
import 'package:get/get.dart';

PreferredSize appBar() {
  SearchButtonController searchButtonController =
      Get.put(SearchButtonController());
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;
  final TextEditingController filterPhoneNumber = TextEditingController();

  return PreferredSize(
    preferredSize: Size(width * space_4 * space_14 + 2, height * space_9),
    child: AppBar(
      backgroundColor: signInColor,
      leading: Row(
        children: [
          SizedBox(width: width * space_4 + 3),
          Container(
            height: height * space_5,
            width: width * space_5,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('icons/liveasy_logo_white.png',
                  width: width * space_5, height: height * space_5 - 0.77),
            ),
          ),
        ],
      ),
      titleSpacing: width * space_2,
      title: Container(
          height: height * space_5 - 1,
          width: width * space_15 + 2,
          child: FittedBox(
              fit: BoxFit.cover,
              child: Text('Liveasy',
                  style: TextStyle(
                      color: white,
                      fontSize: size_10,
                      fontWeight: boldWeight)))),
      actions: <Widget>[
        Obx(
          () {
            return searchButtonController.isSearching.value
                ? Container(
                    padding: EdgeInsets.only(bottom: space_1 - 2),
                    width: space_40,
                    child: TextField(
                      onTap: () {},
                      onSubmitted: (String value) async {
                        var shipperDetails =
                            await runGetShipperPhoneNoApi(value);
                        var transporterDetails =
                            await runGetTransporterPhoneNoApi(value);
                        if (shipperDetails != null &&
                            transporterDetails != null) {
                          Get.defaultDialog(
                            title: "Search Result",
                            content: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Shipper Details",
                                    style: TextStyle(fontSize: size_10),
                                  ),
                                  SizedBox(height: space_5),
                                  TextButton(
                                    onPressed: () {
                                      Get.put(ShipperController());
                                      Get.to(UpdateShipperScreen(
                                          shipperDetails: shipperDetails));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          shipperDetails.shipperName.toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          shipperDetails.companyName.toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          shipperDetails.phoneNo.toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: space_5),
                                  Text(
                                    "Transporter Details",
                                    style: TextStyle(fontSize: size_10),
                                  ),
                                  SizedBox(height: space_5),
                                  TextButton(
                                    onPressed: () {
                                      Get.put(TransporterController());
                                      Get.to(UpdateTransporterScreen(
                                          transporterDetails:
                                              transporterDetails));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          transporterDetails.transporterName
                                              .toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          transporterDetails.companyName
                                              .toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          transporterDetails.phoneNo.toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (transporterDetails != null) {
                          Get.defaultDialog(
                            title: "Search Result",
                            content: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: space_5),
                                  Text(
                                    "User not exist as Shipper",
                                    style: TextStyle(color: forgotColor),
                                  ),
                                  SizedBox(height: space_5),
                                  Text(
                                    "Transporter Details",
                                    style: TextStyle(fontSize: size_10),
                                  ),
                                  SizedBox(height: space_5),
                                  TextButton(
                                    onPressed: () {
                                      Get.put(TransporterController());
                                      Get.to(UpdateTransporterScreen(
                                          transporterDetails:
                                              transporterDetails));
                                    },
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            transporterDetails.transporterName
                                                .toString(),
                                          ),
                                          SizedBox(
                                            width: space_2,
                                          ),
                                          Text(
                                            transporterDetails.companyName
                                                .toString(),
                                          ),
                                          SizedBox(
                                            width: space_2,
                                          ),
                                          Text(
                                            transporterDetails.phoneNo
                                                .toString(),
                                          ),
                                        ],
                                      ),

                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (shipperDetails != null) {
                          Get.defaultDialog(
                            title: "Search Result",
                            content: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: space_5),
                                  Text(
                                    "User not exist as Transporter",
                                    style: TextStyle(color: forgotColor),
                                  ),
                                  SizedBox(height: space_5),
                                  Text(
                                    "Shipper Details",
                                    style: TextStyle(fontSize: size_10),
                                  ),
                                  SizedBox(height: space_5),
                                  TextButton(
                                    onPressed: () {
                                      Get.put(ShipperController());
                                      Get.to(UpdateShipperScreen(
                                          shipperDetails: shipperDetails));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          shipperDetails.shipperName.toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          shipperDetails.companyName.toString(),
                                        ),
                                        SizedBox(
                                          width: space_2,
                                        ),
                                        Text(
                                          shipperDetails.phoneNo.toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          Get.defaultDialog(
                            title: "Search Result",
                            middleText: "User not exist as\nShipper or Transporter",
                            middleTextStyle: TextStyle(color: forgotColor),
                          );
                        }
                      },
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      enableSuggestions: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: filterPhoneNumber,
                      style: TextStyle(
                        color: white,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchButtonController.isSearching.value = false;
                          },
                          icon: Icon(Icons.close_outlined),
                          iconSize: size_10 + 1,
                        ),
                        hintText: "Search Phone No...",
                        hintStyle: TextStyle(
                            color: hintColor, fontSize: size_8 - 0.31),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      searchButtonController.isSearching.value = true;
                    },
                    icon: searchButtonController.isSearching.value
                        ? Icon(Icons.close_outlined)
                        : Icon(Icons.search),
                    iconSize: size_8 + 1);
          },
        ),
        SizedBox(width: width * space_4 - 1),
        Center(child: Text("admin")),
        SizedBox(width: width * space_2),
        Center(
            child: IconButton(
                onPressed: () {}, //TODO: Admin Account settings
                icon: Icon(Icons.person),
                iconSize: space_5)),
        SignOutButtonWidget(),
        SizedBox(width: width * space_10)
      ],
    ),
  );
}
