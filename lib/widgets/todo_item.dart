import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../items_feature/item_details_page.dart';

class TodoItem extends StatelessWidget {
  bool isChecked = false;
  final String title;
  final String description;
  final String date;

  /// This is used for passing a custom
  /// function callback when the `InkWell`
  /// in this widget is pressed.
  final VoidCallback? onItemPressed;
  TodoItem(
      {super.key,
      required this.title,
      required this.description,
      required this.date, 
      this.onItemPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemPressed,
      // () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (_) {
      //       return ItemDetail();
      //     }),
      //   );
      // },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Color(0xffdfe3ee)),
        height: 120,
        child: Row(
          children: [
            Container(
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {},
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(description),
                Text(date)
              ],
            )
          ],
        ),
      ),
    );
  }
}
