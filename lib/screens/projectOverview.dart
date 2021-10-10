import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slark_v2/components/memberImage.dart';
import 'package:slark_v2/components/moreMembers.dart';
import 'package:slark_v2/components/tasksCards.dart';
import 'package:slark_v2/constraints.dart';
import 'package:slark_v2/screens/Kanbanboard.dart';
import 'package:slark_v2/screens/tasks.dart';

class SheetView extends StatefulWidget {
  const SheetView({Key? key}) : super(key: key);

  @override
  _SheetViewState createState() => _SheetViewState();
}

class _SheetViewState extends State<SheetView> {
  bool memberOver4 = true;
  var taskOptions = [
    'My Tasks',
    'Add Task',
    'Progress',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            //Title
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Slark Project',
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(26.0),
                    ),
                  ),
                  Container(
                    height: 15.0,
                    // ignore: deprecated_member_use
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            //Progress
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'In Progress',
                        style: GoogleFonts.poppins(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '40%',
                        style: GoogleFonts.poppins(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Colors.grey[300],
                      minHeight: 5.0,
                      valueColor: new AlwaysStoppedAnimation(kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            //Date
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20.0)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.date_range_outlined,
                        color: kPrimaryColor,
                        size: ScreenUtil().setHeight(24.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(15.0),
                  ),
                  Text(
                    "Nov 12, at 9:00 AM",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      fontSize: ScreenUtil().setSp(14.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40.0),
            ),
            //Members
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0),
              ),
              child: Text(
                "Team Members",
                style: GoogleFonts.poppins(
                  color: Color(0xff4d3a58),
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(18.0),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20.0),
              ),
              child: Column(
                children: [
                  Wrap(
                    spacing: 20.0,
                    children: [
                      MemberImg(
                        image: 'assets/images/profile.png',
                      ),
                      MemberImg(
                        image: 'assets/images/profile.png',
                      ),
                      MemberImg(
                        image: 'assets/images/profile.png',
                      ),
                      Visibility(
                        child: MoreMembers(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20.0),
            ),
            //Tasks
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(18.0),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return taskOptions.map((option) {
                        return PopupMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList();
                    },
                    onSelected: (option) {
                      if (option == 'Progress') {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KanbanBoard(),
                          ),
                        );
                      } else if (option == 'My Tasks') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TasksScreen(),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.more_horiz,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20.0),
              ),
              child: TaskCard(),
            ),
          ],
        ),
      ),
    );
  }
}
