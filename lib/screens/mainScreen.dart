import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slark_v2/components/modalChat.dart';
import 'package:slark_v2/components/project_summery.dart';
import 'package:slark_v2/components/spaces.dart';
import 'package:slark_v2/constraints.dart';
import 'package:slark_v2/screens/mail.dart';
import 'package:slark_v2/screens/projects.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool hasNotification = true;
  bool hasMsg = true;
  String chosenSpace = '';
  double xoffset = 0;
  double yoffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0.0),
      duration: Duration(milliseconds: 200),
      child: Scaffold(
        backgroundColor: Color(0xfff6f7ef),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10.0),
                ) +
                EdgeInsets.only(
                  top: ScreenUtil().setHeight(50.0),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            xoffset = 0;
                            yoffset = 0;
                            isDrawerOpen = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      )

                    //Image pressed to go to profile
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            xoffset = 240;
                            yoffset = 90;
                            isDrawerOpen = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              height: 40.0,
                              width: 40.0,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Notification
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          hasNotification = !hasNotification;
                        });
                      },
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications_none,
                            color: kPrimaryColor,
                            size: ScreenUtil().setHeight(30.0),
                          ),
                          Visibility(
                            visible: hasNotification,
                            child: Positioned(
                              right: 2,
                              top: 3,
                              child: Container(
                                height: ScreenUtil().setHeight(10.0),
                                width: ScreenUtil().setWidth(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xffedefdf))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //New Project/Space
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 25.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40.0),
          ),
          //Spaces
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: deprecated_member_use
                Text(
                  'Space Name',
                  style: GoogleFonts.poppins(
                    color: Color(0xff4d3a58),
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(14.0),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    print('Space');
                    showModal();
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: Color(0xff4d3a58),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10.0),
          ),
          //Search
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15.0),
                vertical: ScreenUtil().setHeight(2.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: ScreenUtil().setHeight(20.0),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10.0),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.none,
                          fontSize: ScreenUtil().setSp(14.0),
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(14.0),
                            color: Colors.grey),
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          //Recent Chats
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15.0),
            ),
            child: Row(
              children: [
                Text(
                  "Recent Chats",
                  style: GoogleFonts.poppins(
                    color: Color(0xff4d3a58),
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(18.0),
                  ),
                ),
                Spacer(),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MailScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.poppins(
                      color: kPrimaryColor,
                      fontSize: ScreenUtil().setSp(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20.0),
            ),
            child: Wrap(
              // spacing: 20.0,
              children: [
                Stack(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(50.0),
                      width: ScreenUtil().setWidth(60.0),
                      decoration: BoxDecoration(
                        color: Color(0xff4d3a58).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () {
                          print('Helllo');
                          openBottomSheet();
                        },
                        child: Image(
                          height: 30.0,
                          width: 30.0,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Positioned(
                        right: 1,
                        top: 2,
                        child: Container(
                          height: ScreenUtil().setHeight(10.0),
                          width: ScreenUtil().setWidth(10.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(50.0),
                      width: ScreenUtil().setWidth(60.0),
                      decoration: BoxDecoration(
                        color: Color(0xff4d3a58).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: () {
                          print('Helllo');
                        },
                        child: Image(
                          height: 30.0,
                          width: 30.0,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: hasMsg,
                      child: Positioned(
                        right: 1,
                        top: 2,
                        child: Container(
                          height: ScreenUtil().setHeight(10.0),
                          width: ScreenUtil().setWidth(10.0),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(30.0),
          ),
          //Projects
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20.0),
                        ) +
                        EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
                    child: Row(
                      children: [
                        Text(
                          "Active Projects",
                          style: GoogleFonts.poppins(
                            color: Color(0xff4d3a58),
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(18.0),
                          ),
                        ),
                        Spacer(),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProjectsScreen()),
                            );
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                              fontSize: ScreenUtil().setSp(12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10.0),
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                          ProjectSummery(),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                          ProjectSummery(),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                          ProjectSummery(),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  showModal() {
    return showModalBottomSheet(
        context: context,
        barrierColor: Colors.black38,
        backgroundColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (BuildContext context) {
          double height = MediaQuery.of(context).size.height;

          return Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Spaces'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView(
                      children: [
                        Spaces(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return ModalChat();
        });
  }
}
