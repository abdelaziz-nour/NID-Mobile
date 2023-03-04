import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/sign_up.dart';

class Firist_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Firist_screenState();
  }
}

class Firist_screenState extends State<Firist_screen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'نظام تجديد البطاقه القوميه',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
          backgroundColor: Color.fromARGB(255, 11, 35, 55),
        ),

        //background color
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 206, 214, 226),
                  Color.fromARGB(255, 102, 145, 180),
                ],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: ListView(children: [
                  CircleAvatar(
                    radius: screenWidth / 3.8,
                    child: getImageAsset(),
                    backgroundColor: Color.fromARGB(255, 206, 214, 226),
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: Text(
                            'العربيه',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Sign_up(2);
                            }));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Sign_up(1);
                            }));
                          },
                        ),
                      ),
                    ),
                  ])
                ]),
              ),
            )));
  }
}

Widget getImageAsset() {
  AssetImage assetimage = const AssetImage('image/im.jpg.jpg');
  Image image = Image(
    image: assetimage,
    width: 150.0,
    height: 150.0,
  );

  return ClipRRect(
    borderRadius: BorderRadius.circular(100.0),
    child: image,
    clipBehavior: Clip.hardEdge,
  );
}
