import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api/database_helper.dart';
import 'package:flutter_application_1/app_screen/notification.dart';

import 'enter_data.dart';

class alert extends StatefulWidget {
  alert(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() => alertState(language);
}

class alertState extends State<alert> {
  DatabaseHelper _databaseHelper = DatabaseHelper();

  final int language;
  alertState(this.language);
  final GlobalKey<FormState> _log_informkey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final wordController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 159, 196),
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
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 229, 234, 237),
                    Color.fromARGB(255, 188, 178, 178),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 30,
                    color: Colors.black12,
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 0),
                  child: Text(
                    ':الرجاء مراعات التنبيهات التاليه لضمان اكمال الاجراءات بنجاح',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 60),
                  child: Text(
                    "يرجى نقل البيانات من البطاقه القديمه تجنبا من الوقوع في الاخطاء- ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 60),
                  child: Text(
                    " ادخل بياناتك باللغه العربيه فقط اما الارقام ادخلها  باللغه الانجليزيه- ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 60),
                  child: Text(
                    " سيتم اشعارك بتاريخ اكمالك للاجراءات في مجمع خدمات الجمهور - ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 90),
                  child: Text(
                    "   سيتم اشعارك عندما تكون  بطاقتك جاهزه للاستلام - ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 90),
                  child: Text(
                    "          لبداية خطوات التجديد اضغط على زر البدايه - ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20, left: 90),
                  child: Text(
                    "  لمتابعة حالة بطاقتك اضغط على زر المتابعه- ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 11, 35, 55)),
                            //end coloring
                            //start bordering
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text(
                          language == 1 ? " البدايه" : "",
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await _databaseHelper.loginData(
                              userController.text.trim(), wordController.text);
                          //if(_log_informkey.currentState!.validate()){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Enter_data(language);
                          }));
                        }
                        // },
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 11, 35, 55)),
                            //end coloring
                            //start bordering
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text(
                          language == 1 ? " المتابعه" : "",
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          var data = await _databaseHelper.get_user_card();
                          // print('@@@@@@@@@@@@@@@@');
                          // print(await _databaseHelper.get_user_card());
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return notf(language, data);
                          }));
                        }
                        // },
                        ),
                  ),
                ]),
              ],
            )),
      ),
    );
  }
}
