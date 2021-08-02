// import 'package:flutter/material.dart';
// import 'package:liveasy_admin/constants/color.dart';
// import 'package:liveasy_admin/constants/fontWeight.dart';
// import 'package:liveasy_admin/constants/screenSizeConfig.dart';
// import 'package:liveasy_admin/constants/space.dart';
// import 'package:liveasy_admin/widgets/signOutButton.dart';
//
// class SearchIconWidget extends StatefulWidget {
//   // final AppBar appBar;
//   //
//   // const SearchIconWidget({required this.appBar});
//
//   @override
//   _SearchIconWidgetState createState() => _SearchIconWidgetState();
// }
//
// class _SearchIconWidgetState extends State<SearchIconWidget> {
//   final TextEditingController filterPhoneNumber = TextEditingController();
//
//   Icon _searchIcon = Icon(Icons.search);
//   Widget _appBarTitle = new Text('Search..');
//   List phoneNo = [];
//   List filteredPhoneNo = [];
//   bool isSearching = false;
//   double height = SizeConfig.safeBlockVertical!;
//   double width = SizeConfig.safeBlockHorizontal!;
//
//   // void searchPressed() {
//   //   print("function is running");
//   //   setState(() {
//   //     isSearching = true;
//   //     if (this._searchIcon.icon == Icons.search) {
//   //       this._searchIcon = Icon(Icons.close);
//   //       this._appBarTitle = TextField(
//   //         controller: filterPhoneNumber,
//   //         decoration: InputDecoration(
//   //             border: InputBorder.none,
//   //             enabledBorder: InputBorder.none,
//   //             focusedBorder: InputBorder.none,
//   //             prefixIcon: Icon(Icons.search),
//   //             hintText: "Search..."),
//   //       );
//   //     } else {
//   //       this._searchIcon = new Icon(Icons.search);
//   //       this._appBarTitle = new Text('Search..');
//   //       filteredPhoneNo = phoneNo;
//   //       filterPhoneNumber.clear();
//   //     }
//   //   });
//   // }
//
//   @override
//   PreferredSizeWidget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size(width * 1440, height * 45),
//       child: AppBar(
//         backgroundColor: signInColor,
//         leading: Row(children: [
//           SizedBox(width: width * space_4 + 3),
//           Container(
//               height: height * space_5,
//               width: width * space_5,
//               child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: Image.asset('icons/liveasy_logo_white.png',
//                       width: width * space_5, height: height * space_5 - 0.77)))
//         ]),
//         titleSpacing: width * space_2,
//         title: isSearching
//             ? TextField(
//                 controller: filterPhoneNumber,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     prefixIcon: Icon(Icons.search),
//                     hintText: "Search..."),
//               )
//             : Container(
//                 height: height * space_4+4,
//                 width: width * space_15+2,
//                 child: FittedBox(
//                     fit: BoxFit.cover,
//                     child: Text('Liveasy',
//                         style: TextStyle(
//                             color: white,
//                             fontSize: space_4,
//                             fontWeight: boldWeight)))),
//         actions: <Widget>[
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   isSearching = true;
//                 });
//               },
//               icon: isSearching ? Icon(Icons.close) : Icon(Icons.search),
//               iconSize: space_3+2),
//           SizedBox(width: width * space_4-1),
//           Center(child: Text("admin")),
//           SizedBox(width: width * space_2),
//           Center(
//               child: IconButton(
//                   onPressed: () {}, //TODO: Admin Account settings
//                   icon: Icon(Icons.person),
//                   iconSize: space_5)),
//           SignOutButtonWidget(),
//           SizedBox(width: width * space_10)
//         ],
//       ),
//     );
//   }
// }
