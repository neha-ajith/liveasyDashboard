// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/signOutButton.dart';

class SearchIconWidget extends StatefulWidget {
  @override
  _SearchIconWidgetState createState() => _SearchIconWidgetState();
}

class _SearchIconWidgetState extends State<SearchIconWidget> {

  final TextEditingController filterPhoneNumber = TextEditingController();
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');
  List phoneNo = [];
  List filteredPhoneNo = [];

  void searchPressed() {
    setState(() {
      if(this._searchIcon.icon == Icons.search){
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          controller: filterPhoneNumber,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search), hintText: "Search..."
          ),
        );
      }else{
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredPhoneNo = phoneNo;
        filterPhoneNumber.clear();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




PreferredSize appBar() {
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;


  return PreferredSize(
    preferredSize: Size(width * 1440, height * 45),
    child: AppBar(
        backgroundColor: signInColor,
        leading: Row(children: [
          SizedBox(width: width * 23),
          Container(
              height: height * 25,
              width: width * 25,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('icons/liveasy_logo_white.png',
                      width: width * 25, height: height * 24.33)))
        ]),
        titleSpacing: width * 10,
        title: Container(
            height: height * 24,
            width: width * 77,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text('Liveasy',
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: boldWeight)))),
        actions: [
          IconButton(
              onPressed: search, // TODO: Search Logic pending
              icon: Icon(Icons.search),
              iconSize: 17),
          SizedBox(width: width * 19),
          Center(child: Text("admin")),
          SizedBox(width: width * 10),
          Center(
              child: IconButton(
                  onPressed: () {}, //TODO: Admin Account settings
                  icon: Icon(Icons.person),
                  iconSize: 25)),
          SignOutButtonWidget(),
          SizedBox(width: width * 50)
        ]),
  );

}


final searchPhoneNo = SearchIconWidget();
void search() {
  searchPhoneNo.searchPressed();
}
