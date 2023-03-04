import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/card.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class notf extends StatefulWidget {
  notf(
    this.language,
    this.list,
    // this.FirstName,
    // this.SecondName,
    // this.ThirdName,
    // this.FourtName,
    // this.Old_id,
    // this.statu,
    // this.Blood_Type,
    // this.Job,
    // this.Address,
    // this.Phone
  );
  // {super.key, required this.name, required this.DOB, required this.POB, required this.blood, required this.job, required this.adress, required this.phone, required this.NID});
  final int language;
  final list;
  // final String FirstName;
  // final String SecondName;
  // final String ThirdName;
  // final String FourtName;
  //   final String Blood_Type;
  // final String Job;
  // final String Address;
  // final String Phone;
  // final String Old_id;
  // final String statu;

  @override
  State<StatefulWidget> createState() {
    return notfState(this.language, this.list
        // this.FirstName,
        // this.SecondName,
        // this.ThirdName,
        // this.FourtName,
        // this.Old_id,
        // this.statu,
        // this.Blood_Type,
        // this.Job,
        // this.Address,
        // this.Phone
        );
    //name,DOB,POB,blood,job,adress,phone,NID);
  }
}

class notfState extends State<notf> {
  final int language;
  final list;
  // final String FirstName;
  // final String SecondName;
  // final String ThirdName;
  // final String FourtName;
  // final String Blood_Type;
  // final String Job;
  // final String Address;
  // final String Phone;
  // final String Old_id;
  // final String statu;

  notfState(this.language, this.list
      // this.FirstName,
      // this.SecondName,
      // this.ThirdName,
      // this.FourtName,
      // this.Old_id,
      // this.statu,
      // this.Blood_Type,
      // this.Job,
      // this.Address,
      // this.Phone
      );
  int notificationday = 0;
  int notificationmonth = 0;
  int notificationyear = 0;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    if (list[0]['date_of_accept'] == null &&
        list[0]['date_of_reject'] != null) {
      print('rejected');
      _scheduleNotification(
          'Card Rejected', 'الرجاء مراجعة مركز خدمات الجمهور');
      setState(() {
        notificationyear =
            int.parse(list[0]['date_of_reject'].toString().substring(0, 4));
        notificationmonth =
            int.parse(list[0]['date_of_reject'].toString().substring(5, 7));

        notificationday =
            int.parse(list[0]['date_of_reject'].toString().substring(9, 10));
        print(notificationday + notificationmonth + notificationyear);
      });
    } else if (list[0]['date_of_reject'] == null &&
        list[0]['date_of_accept'] != null) {
      _scheduleNotification('Accept Date',
          'الرجاء الذهاب لمركة خدمات الجمهور لإتمام اجرائات البطاقة القومية');
      setState(() {
        print('accepted');
        notificationyear =
            int.parse(list[0]['date_of_accept'].toString().substring(0, 4));
        notificationmonth =
            int.parse(list[0]['date_of_accept'].toString().substring(5, 7));
        notificationday =
            int.parse(list[0]['date_of_accept'].toString().substring(8, 10));
        print(notificationday + 2);
      });
    }
  }

  void _scheduleNotification(String title, String content) async {
    var scheduledNotificationDateTime = DateTime(
        notificationyear, notificationmonth, notificationday + 2, 1, 00, 00);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id', 'channel_name',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(0, title, content,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) {
    var box = card(
        language,
        list[0]['FirstName'] +
            ' ' +
            list[0]['SecondName'] +
            ' ' +
            list[0]['ThirdName'] +
            ' ' +
            list[0]['FourtName'],
        list[0]['date_of_accept'] == null
            ? list[0]['date_of_reject']
            : list[0]['date_of_accept'],
        list[0]['statu'],
        list[0]['Blood_Type'],
        list[0]['Job'],
        list[0]['Address'],
        int.parse(list[0]['Phone']),
        int.parse(list[0]['Old_id']));
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 214, 226),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 35, 55),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  'image/im.jpg.jpg',
                )),
          ),
          elevation: 0,
          actions: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 135, 159, 196),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    'image/im.jpg.jpg',
                  )),
            ),
          ]),
      body: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'Your card status is:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Text(
                'accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
          Expanded(
            child: Container(
              height: screenHeight / 2,
              width: screenWidth / 5,
              child: box,
            ),
          ),
        ],
      ),
    );
  }
}
