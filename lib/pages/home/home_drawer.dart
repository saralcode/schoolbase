import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:schoolbase/pages/home/ExamResult/exam_result.dart';
import 'package:schoolbase/pages/home/FeePay/fee_pay.dart';
import 'package:schoolbase/pages/home/students/manage_students.dart';
import 'package:schoolbase/state/home_page_controller.dart';
import 'package:get/get.dart';

class NavigationItems {
  IconData icon;
  String text;
  Widget page;
  NavigationItems(this.icon, this.text, this.page);
}

List<NavigationItems> navigationItems = [
  NavigationItems(Icons.person_add, "Manage Students", const ManageStudents()),
  NavigationItems(Icons.attach_money, "Fee Pay", const FeePay() ),
  NavigationItems(Icons.book_sharp, "Exam Result", const ExamResult()),
  NavigationItems(Icons.settings, "Setting", const FeePay()),
];

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Session: 2022-2023",
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: GetBuilder<ActiveIndex>(builder: (snapshot) {
          return FocusTraversalGroup(
            key: UniqueKey(),
            child: ListView.builder(
                itemCount: navigationItems.length,
                itemBuilder: (context, index) {
                  NavigationItems item = navigationItems.elementAt(index);
                  return Card(
                    child: ListTile(
                      iconColor: Colors.blue,
                      onTap: () {
                        snapshot.updateIndex(index);
                      },
                      selected: snapshot.index.value == index,
                      selectedTileColor: Colors.blue.shade900,
                      selectedColor: Colors.white,
                      title: Text(item.text),
                      leading: Icon(item.icon),
                    ),
                  );
                }),
          );
        }))
      ]),
    );
  }
}
