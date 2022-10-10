import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:schoolbase/pages/home/home_drawer.dart';
import 'package:schoolbase/state/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(ActiveIndex());
    return Scaffold(
        body: Row(
      children: [
        Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const HomeDrawer()),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetX<ActiveIndex>(
                  builder: (controlller) => navigationItems.elementAt(controlller.index.value).page )),
        )
      ],
    ));
  }
}
