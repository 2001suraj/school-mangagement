import 'package:flutter/material.dart';

import '../auth/login_page.dart';
import '../page/Activity/School_activity.dart';
import '../page/Apply leave/school_leave.dart';
import '../page/Downloads/download.dart';
import '../page/Notifications/notification.dart';
import '../page/Track Bus/bustrack.dart';
import '../page/attendance/school_attendance.dart';
import '../page/exam/exam.dart';
import '../page/feee/fee.dart';
import '../page/home work/homework.dart';
import '../page/home/home_screen.dart';
import '../page/library/library.dart';
import '../page/logout/logout.dart';
import '../page/profile/profile.dart';
import '../page/time table/time_table.dart';

class SchoolDrawer1 {
  List<String> image1 = [
    'assets/images/home.png',
    'assets/images/attendance.png',
    'assets/images/homework.png',
    'assets/images/profile.png',
    'assets/images/exam.png',
    'assets/images/fees.png',
    'assets/images/timetable.png',
    'assets/images/library.png',
    'assets/images/downloads.png',
    'assets/images/trackbus.png',
    'assets/images/applyleave.png',
    'assets/images/activity.png',
    'assets/images/notification.png',
    'assets/images/logout.png',
  ];
  List<String> iconName1 = [
    'Home',
    'Attendance',
    'Home work',
    'Profile',
    'Exam',
    'Fee',
    'Time Table',
    'Library',
    'Downloads',
    'Track Bus',
    'Apply Leave',
    'Activity',
    'Notification',
    'Logout',
  ];
  List<Widget> route1=   [
    SchoolHomePage(),

    SchholAttendance(),
    SchoolHomeWork(),
    SchoolStudentProfile(),


    SchoolExamPage(),
    SchoolFees(),
    SchoolTimeTable(),

    SchoolLibrary(),
    SchoolDownloads(),

    TrackBus(),
    SchoolApplyLeave(),
    SchoolActivityPage(),
    SchoolNotification(),
    // SchoolLogout(),
    SchoolLogIn(),

    
  ];

}
