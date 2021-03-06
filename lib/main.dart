import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './route/get_to.dart';
import './pages/state_simple.dart';
import './pages/state_reactive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX pratice',
      home: HomePage(),
      getPages: [
        GetPage(
          name: '/next',
          page: () => GetTo(),
        ),
        GetPage(
          name: '/state-simple',
          page: () => StateSimple(),
        ),
        GetPage(
          name: '/state-reative',
          page: () => StateReactive(),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextButton buildTextButton(Function fun, String text) {
    return TextButton(
      onPressed: () {
        fun();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX example')),
      body: Center(
        child: Column(
          children: [
            Text(
              "라우트 관리",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            buildTextButton(
                  () {
                Get.to(GetTo());
              },
              'Get.to()',
            ),
            buildTextButton(
                  () {
                Get.toNamed('/next');
              },
              'Get.toNamed()',
            ),
            buildTextButton(
                  () {
                Get.off(GetTo());
              },
              'Get.off()',
            ),
            buildTextButton(
                  () {
                Get.offAll(GetTo());
              },
              'Get.offAll()',
            ),
            buildTextButton(
                  () {
                Get.snackbar(
                  'Snackbar',
                  'Snackbar',
                  snackPosition: SnackPosition.TOP,
                );
              },
              'Get.snackbar()',
            ),
            buildTextButton(
                  () {
                Get.showSnackbar(
                  GetBar(
                    title: 'Snackbar',
                    message: 'Snackbar',
                    duration: Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM,
                  ),
                );
              },
              'Get.showSnackbar()',
            ),
            buildTextButton(
                  () {
                Get.defaultDialog(title: 'Dialog', middleText: 'Dialog');
              },
              'Get.defaultDialog()',
            ),
            buildTextButton(
                  () {
                Get.dialog(
                  Dialog(
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text('Dialog'),
                      ),
                    ),
                  ),
                );
              },
              'Get.dialog()',
            ),
            buildTextButton(
                  () {
                Get.bottomSheet(
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Center(
                      child: Text('BottomSheet'),
                    ),
                  ),
                );
              },
              'Get.bottomSheet()',
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "상태 관리",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            buildTextButton(
                  () {
                Get.toNamed('/state-simple');
              },
              'State simple 방식',
            ),
            buildTextButton(
                  () {
                Get.toNamed('/state-reative');
              },
              'State reative 방식',
            ),
          ],
        ),
      ),
    );
  }
}